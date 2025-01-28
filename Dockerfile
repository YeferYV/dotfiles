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
  pacman -Sy --noconfirm fuse2 git less zsh \
  && curl -L https://github.com/Jguer/yay/releases/download/v12.1.2/yay_12.1.2_x86_64.tar.gz | tar -xzf- --strip-components=1 --directory="/usr/local/bin" "yay_12.1.2_x86_64/yay" \
  && curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage  --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim \
  && yes | pacman -Scc; \
  fi

# Debian dependencies:
RUN if [[ -e /bin/apt ]]; then \
  apt update \
  && DEBIAN_FRONTEND=noninteractive apt install -y curl file libfuse2 gcc git less sudo xz-utils zsh \
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
      eza \
      fzf \
      kanata \
      lazygit \
      ripgrep \
      starship \
      xclip \
      yazi \
    -f https://github.com/NixOS/nixpkgs/archive/e16e376ee3ece686725bbf454255a5dcc9a40c7a.tar.gz;
    sudo su - -c 'nix-collect-garbage -d'
====

# Dotfiles:
COPY --chown=drksl . /home/drksl/.config/.files

# stow:
RUN sudo --login --user=drksl -- bash <<'===='
  mkdir -p $HOME/.local
  ln -sf ~/.config/.files/dotfiles/.local/*                 ~/.local
  ln -sf ~/.config/.files/dotfiles/.config/*                ~/.config
  ln -sf ~/.config/.files/dotfiles/.config/shell/.gitconfig ~/.gitconfig
  ln -sf ./.config/.files/dotfiles/.config/shell/.xinitrc   ~/.xinitrc
  ln -sf ./.config/.files/dotfiles/.config/shell/.zprofile  ~/.zprofile
  ln -sf ~/.config/.files/dotfiles/.config/zsh/.zshrc       ~/.zshrc
====

ENTRYPOINT ["/bin/zsh","-l"]
