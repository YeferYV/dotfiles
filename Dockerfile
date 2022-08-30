# docker build -t archrice .
# docker run -it \
#            --name archrice \
#            --volume=$(pwd):/home/drksl/.config/dotfiles \
#            --volume=/run/user/1000/pipewire-0:/run/user/1000/pipewire-0 \
#            --volume=/tmp/.X11-unix:/tmp/.X11-unix \
#            archrice

FROM archlinux/archlinux:base-devel

RUN  sed -i '33s/#//' /etc/pacman.conf \
     && sed -i '34s/N/#N/' /etc/pacman.conf \
     && sed -i '37s/V/#V/' /etc/pacman.conf \
     && pacman-key --init \
     && pacman-key --populate \
     && pacman -Sy  --noconfirm archlinux-keyring \
     && pacman -Syu --noconfirm \
     bat \
     clang \
     ffmpegthumbnailer \
     fzf \
     git \
     moreutils \
     mupdf-tools \
     nodejs \
     npm \
     openssh \
     perl-file-mimeinfo \
     pipewire \
     python-pip \
     ripgrep \
     sxiv \
     stow \
     trash-cli \
     unzip \
     wezterm \
     zathura \
     zathura-pdf-mupdf \
     zsh \
     zsh-autosuggestions\
     # xsixel dependencies \
     && pacman -S --noconfirm libxkbfile xorg-font-util xorg-xkbcomp \
     # user settings \
     && useradd -mG wheel drksl \
     && chsh --shell /usr/bin/zsh drksl \
     && echo root:toor | chpasswd \
     && echo drksl:toor | chpasswd \
     && echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/drksl
     # AUR: \
     # && echo "drksl ALL=(ALL) NOPASSWD: /usr/bin/pacman" > /etc/sudoers.d/allow_drksl_to_pacman \
     # && echo "root ALL=(ALL) CWD=* ALL" > /etc/sudoers.d/permissive_root_Chdir_Spec \
     # && sudo -u "drksl" bash -c "git clone https://aur.archlinux.org/paru-bin.git /home/drksl/paru-bin" \
     # && sudo -u "drksl" bash -c "cd /home/drksl/paru-bin && makepkg -s" \
     # && pacman -U --noconfirm /home/drksl/paru-bin/paru-bin* \
     # && sudo -u "drksl" -D~ bash -c "paru -S --noconfirm cht.sh-git lf-bin spaceship-prompt-git zsh-fast-syntax-highlighting libsixel"

# Expose ports
EXPOSE 22/tcp
EXPOSE 8080/tcp
EXPOSE 5900/tcp

# Set environments
USER drksl
WORKDIR /home/drksl
ENV USER="drksl"
ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/run/user/1000
ENV APPIMAGE_EXTRACT_AND_RUN=1

# Dotfiles
# COPY --chown=drksl wslfiles/.config /home/drksl/.config
# COPY --chown=drksl wslfiles/.local /home/drksl/.local
# COPY --chown=drksl wslfiles/.config/shell/.zprofile /home/drksl/.zprofile
COPY --chown=drksl . /home/drksl/.config/dotfiles/winfiles

# stow:
RUN  mkdir /home/drksl/.local \
     && cd /home/drksl/.config/dotfiles/winfiles/wslfiles \
     && sudo chown -R drksl:drksl /home/drksl/.config \
     && stow --restow --verbose --target=/home/drksl/.config .config \
     && stow --restow --verbose --target=/home/drksl/.local .local \
     && ln -sf /home/drksl/.config/shell/.zprofile /home/drksl/.zprofile \
     && mkdir -p /home/drksl/.local/share/mpd

# AUR:
RUN  git clone https://aur.archlinux.org/yay-bin.git /home/drksl/yay-bin \
     && cd  /home/drksl/yay-bin && makepkg --noconfirm -si \
     && yay -S --noconfirm cht.sh-git lf-bin spaceship-prompt-git zsh-fast-syntax-highlighting libsixel

# libxfont:
RUN  yay -G libxfont \
     && cd libxfont \
     && sed -i "s/'xproto' 'fontsproto'/'xorgproto'/" PKGBUILD \
     && makepkg -si --noconfirm \
     && cd ..

# xsixel:
RUN  git clone --depth 1 https://github.com/saitoha/xserver-sixel \
     && cd xserver-sixel \
     && sed -i '/sixel/a\    --disable-xwayland \\' build-xsixel.sh \
     && CC=clang ./build-xsixel.sh && sudo make install \
     && cd ..

# mpv-sixel:
RUN  git clone --depth 1 https://github.com/mpv-player/mpv \
     && cd mpv \
     && ./bootstrap.py \
     && ./waf configure --enable-sixel && ./waf build && sudo ./waf install \
     && cd ..

# pipewire:
RUN  sudo mkdir /run/user/1000 \
     && sudo chown -R drksl:drksl /run/user/1000

# openssh
RUN  sudo /usr/bin/ssh-keygen -A \
     && echo "sudo /sbin/sshd" >>/home/drksl/.zprofile

# neovim version 0.7
RUN  curl -Lo $HOME/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage \
     && chmod +x $HOME/.local/bin/nvim

# neovim plugins:
RUN  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
     && $HOME/.local/bin/nvim -u ~/.config/nvim/lua/user/plugins.lua --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"

# clean
RUN  sudo pacman -R --noconfirm clang \
     && yes | yay -Scc \
     && rm -rf /home/drksl/{.bash_logout,.bash_profile,.bashrc,libxfont,mpv,neovim,xserver-sixel,yay-bin} \
     && mkdir /home/drksl/.cache/zsh \
     && printf "\e[1;32m Done! \e[0m\n"

# CMD [ "sudo","/usr/sbin/sshd"]
# SHELL ["/bin/zsh","-l"]
ENTRYPOINT ["/bin/zsh","-l"]

