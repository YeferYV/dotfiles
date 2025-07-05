#================================= Docker run dotfiles ==================================#

# sudo pacman -S docker docker-buildx xorg-xhost
# sudo usermod --append --groups docker $USER
# xhost +
# export DOCKER_BUILDKIT=1
# docker build --tag dotfiles .
# docker run -it \
#     --name dotfiles \
#     --device /dev/dri \
#     --ipc=host \
#     --env DISPLAY \
#     --env WAYLAND_DISPLAY \
#     --env XDG_RUNTIME_DIR \
#     --volume=$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY \
#     --volume=$XDG_RUNTIME_DIR/pipewire-0:$XDG_RUNTIME_DIR/pipewire-0 \
#     --volume=/tmp/.X11-unix:/tmp/.X11-unix \
#     --volume=$PWD:/mnt \
#     dotfiles

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
# RUN pacman -Sy --noconfirm mpv pipewire-pulse
RUN if [[ -e /bin/pacman ]]; then  \
    pacman -Sy --noconfirm fuse2 openssh \
    && version=$(curl -s "https://api.github.com/repos/Jguer/yay/releases/latest" | grep tag_name | cut --delimiter='"' --fields=4 | cut --delimiter='v' --fields=2) \
    && curl -L "https://github.com/Jguer/yay/releases/download/v${version}/yay_${version}_x86_64.tar.gz" | tar -xzf- --strip-components=1 --directory=/usr/local/bin "yay_${version}_x86_64/yay" \
    && curl -L "https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage"  --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim \
    && yes | pacman -Scc; \
  fi

# Debian dependencies:
# RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y mpv pipewire-pulse
RUN if [[ -e /bin/apt ]]; then \
    apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y curl file libfuse2 sudo openssh-client openssh-server \
    && curl -L "https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage"  --create-dirs --output "/usr/local/bin/nvim" && chmod +x /usr/local/bin/nvim \
    && apt autoremove -y; \
  fi

USER drksl
WORKDIR /home/drksl
EXPOSE 22/tcp
EXPOSE 8080/tcp
ENV HOME="/home/drksl"
ENV USER="drksl"
ENV SHELL="/bin/bash"
# ENV DISPLAY=:0
# ENV WAYLAND_DISPLAY=wayland-1
# ENV XDG_RUNTIME_DIR=/run/user/1000
ENV APPIMAGE_EXTRACT_AND_RUN=1
ENV LANG=en_US.UTF-8
ENV LC_ALL=C.UTF-8
ENV TERM="xterm-256color"
ENV ZDOTDIR="$HOME/.vscode/extensions/yeferyv.retronvim/zsh"
SHELL ["/bin/bash","-c"]

# pixi dependencies
# RUN curl -L https://github.com/ivan-hc/MPV-appimage/releases/download/stable-releases/MPV-Media-Player_0.35.1-4_GLIBC-2.36-9_x86-64.AppImage -o ~/.pixi/bin/mpv && chmod +x ~/.pixi/bin/mpv
RUN  curl -L pixi.sh/install.sh | bash \
  && export PATH="$HOME/.pixi/bin:$PATH" \
  && pixi global install bat=0.25.0 eza=0.21.4 fzf=0.62.0 git=2.49.0 lazygit=0.52.0 less=679 p7zip=16.02 ripgrep=14.1.1 starship=1.22.1 yazi=25.5.31 zsh=5.9 \
  && rm -rf ~/.cache

# copy dotfiles:
COPY --chown=drksl . /home/drksl/.config/.files/dotfiles

# install dotfiles:
# archlinux --> ip address
# ubuntu    --> hostname -I
RUN sudo --login --user=drksl -- bash <<'===='
  sudo mkdir -p   /run/sshd
  sudo chmod 0755 /run/sshd
  sudo ssh-keygen -A
  sudo /sbin/sshd
  sudo chown $USER:$USER /run/user/1000
  mkdir -p ~/.vscode/extensions
  ln    -s ~/.config/.files/dotfiles/.config/_gitmodules/retronvim   ~/.vscode/extensions/yeferyv.retronvim
====

ENTRYPOINT ["/home/drksl/.pixi/bin/zsh","-l"]
