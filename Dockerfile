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
  pacman -Sy --noconfirm git less \
  && curl -L https://github.com/Jguer/yay/releases/download/v12.1.2/yay_12.1.2_x86_64.tar.gz | tar -xzf- --strip-components=1 --directory="/usr/local/bin" "yay_12.1.2_x86_64/yay" \
  && curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage  --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim \
  && yes | pacman -Scc; \
  fi

# Debian dependencies:
RUN if [[ -e /bin/apt ]]; then \
  apt update \
  && DEBIAN_FRONTEND=noninteractive apt install -y curl file gcc g++ git less make sudo xz-utils \
  && curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage  --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim \
  && apt autoremove -y; \
  fi

USER drksl
WORKDIR /home/drksl
EXPOSE 22/tcp
EXPOSE 8080/tcp
ENV HOME="/home/drksl"
ENV USER="drksl"
ENV SHELL="/bin/bash"
ENV DISPLAY=:0
ENV XDG_RUNTIME_DIR=/run/user/1000
SHELL ["/bin/bash","-c"]

# install nixpkgs:
RUN yes | sh <(curl -L https://nixos.org/nix/install) --daemon; \
  sudo --login --user=drksl -- <<'===='
    ln -s /nix/var/nix/profiles/per-user/root/profile $HOME/.nix-profile;
    sudo --login nix-env -iA \
      bat \
      blesh \
      eza \
      fzf \
      kanata \
      lazygit \
      lf \
      libsixel \
      ripgrep \
      starship \
      stow \
      xclip \
      xorg.xset \
    -f https://github.com/NixOS/nixpkgs/archive/149a14557b855adc35171d6a0e2a26649f02ead5.tar.gz;
    sudo su - -c 'nix-collect-garbage -d'
====

# Dotfiles:
COPY --chown=drksl . /home/drksl/.config/dotfiles

# stow:
RUN sudo --login --user=drksl -- bash <<'===='
  mkdir -p $HOME/.local/bin
  cd $HOME/.config/dotfiles
  stow --restow --verbose --target="$HOME"/.config .config
  stow --restow --verbose --target="$HOME"/.local .local
  ln -sf "$HOME"/.config/shell/.profile "$HOME"/.profile
  ln -sf "$HOME"/.config/shell/.bashrc "$HOME"/.bash_profile
====

ENTRYPOINT ["/bin/bash","-l"]
