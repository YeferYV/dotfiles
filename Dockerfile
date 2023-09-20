#================================= Docker run ricenix ==================================#

# xhost +
# docker build --tag ricenix .
# docker run -it \
#     --name ricenix \
#     --ipc=host \
#     --volume=/run/user/1000/pipewire-0:/run/user/1000/pipewire-0 \
#     --volume=/tmp/.X11-unix:/tmp/.X11-unix \
#     ricenix

#===================================== Dockerfile ======================================#

# FROM ubuntu
FROM archlinux:base-devel

SHELL ["/bin/bash","-c"]

# add user:
RUN if [[ -e /bin/pacman ]]; then useradd -mG wheel drksl; fi; \
  if [[ -e /bin/apt    ]]; then useradd -mG sudo  drksl; fi; \
  echo root:toor  | chpasswd; \
  echo drksl:toor | chpasswd; \
  mkdir -p /etc/sudoers.d; \
  echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo; \
  echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

# Arch dependencies:
RUN if [[ -e /bin/pacman ]]; then  \
  pacman -Sy --noconfirm git libsixel ripgrep unzip xclip zsh glibc \
  && curl -L https://github.com/Jguer/yay/releases/download/v12.1.2/yay_12.1.2_x86_64.tar.gz | tar -xzf- --strip-components=1 --directory="/usr/local/bin" "yay_12.1.2_x86_64/yay" \
  && curl -L https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage                               --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim; \
  fi

# Debian dependencies:
RUN if [[ -e /bin/apt ]]; then \
  apt update \
  && DEBIAN_FRONTEND=noninteractive apt install -y curl file git gcc libglib2.0-bin libsixel-bin locales make ripgrep sudo unzip xclip xz-utils zsh \
  && curl -L https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage                               --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim; \
  fi

# locales for zsh-autosuggestions:
RUN sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen && locale-gen

USER drksl
WORKDIR /home/drksl
EXPOSE 22/tcp
EXPOSE 8080/tcp
ENV HOME="/home/drksl"
ENV USER="drksl"
ENV SHELL="/bin/zsh"
ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/run/user/1000
SHELL ["/bin/zsh","-c"]

# install nixpkgs:
RUN curl -L https://nixos.org/nix/install | sh \
  && . "$HOME"/.nix-profile/etc/profile.d/nix.sh \
  && nix-channel --update \
  && nix-env -iA \
  bat \
  ffmpeg \
  fzf \
  ghostscript \
  imagemagick \
  lazygit \
  lf \
  mpv \
  pipewire \
  poppler \
  starship \
  stow \
  zsh-autosuggestions \
  zsh-fast-syntax-highlighting \
  -f https://github.com/NixOS/nixpkgs/archive/f3841aa99b019e827633141317ee504a50c8c936.tar.gz # NixOS/nixpkgs/pull/253000/commits

# Dotfiles:
COPY --chown=drksl . /home/drksl/.config/dotfiles/winfiles

# stow:
RUN . "$HOME"/.nix-profile/etc/profile.d/nix.sh \
  && cd /home/drksl/.config/dotfiles/winfiles/wslfiles \
  && stow --restow --verbose --target="$HOME"/.config .config \
  && stow --restow --verbose --target="$HOME"/.local .local \
  && ln -sf "$HOME"/.config/shell/.zprofile "$HOME"/.zprofile

# clean:
RUN . "$HOME"/.nix-profile/etc/profile.d/nix.sh \
  && mkdir /home/drksl/.cache/zsh \
  && rm -rf /home/drksl/{.bash_logout,.bash_profile,.bashrc} \
  && yes | yay -Scc \
  && nix-collect-garbage -d \
  && printf "\e[1;32m Done! \e[0m\n"

ENTRYPOINT ["/bin/zsh","-l"]
