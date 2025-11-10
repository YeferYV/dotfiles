<img width="1366" height="768" alt="screenshot" src="https://github.com/user-attachments/assets/3d01d40d-0983-4c81-8210-e7f26a82e114" />

## Hyprland keybindings

|         keymaps          | description                        |
| :----------------------: | :--------------------------------- |
|     `super + Return`     | open terminal                      |
|       `super + w`        | open chrome                        |
|       `super + W`        | close chrome                       |
|       `super + x`        | close window                       |
|       `super + X`        | exit hyprland                      |
|       `super + v`        | float window                       |
|       `super + r`        | open program                       |
|       `super + F`        | fullscreen                         |
|       `super + t`        | toggle window layout               |
|     `super + escape`     | close notification                 |
| `super + shift + escape` | reopen notification                |
|      `super + left`      | focus left window                  |
|      `super + down`      | focus down window                  |
|       `super + up`       | focus up window                    |
|     `super + right`      | focus right window                 |
| `super + shift + right`  | increase window size horizontal    |
|  `super + shift + left`  | decrease window size horizontal    |
|   `super + shift + up`   | increase window size vertical      |
|  `super + shift + down`  | decrease window size vertical      |
|  `super + ctrl + left`   | swap window left                   |
|  `super + ctrl + down`   | swap window down                   |
|   `super + ctrl + up`    | swap window up                     |
|  `super + ctrl + right`  | swap window right                  |
|     `super + 1...9`      | switch to workspace 1...9          |
|       `super + 0`        | switch to workspace 10             |
|  `super + shift + tab`   | previous active workspace          |
|      `super + tab`       | next active workspace              |
|       `super + h`        | previous active workspace          |
|       `super + l`        | next active workspace              |
|       `super + s`        | previous workspace                 |
|       `super + f`        | next workspace                     |
|   `super + semicolon`    | recent workspace                   |
|     `super + equal`      | disable gaps                       |
|     `super + minus`      | enable gaps                        |
| `super + shift + 1...9`  | move to workspace 1...9            |
|   `super + shift + 0`    | move to workspace 10               |
|       `super + d`        | toggle scratchpad (swallow window) |
|       `super + D`        | move window to scratchpad          |
|  `super + right click`   | move window                        |
|   `super + left click`   | resize window                      |
|     `super + space`      | chrome/mpv play-pause              |
|       `super + m`        | chrome/mpv rewind                  |
|       `super + p`        | chrome/mpv forward                 |
|    `super + KP_Begin`    | chrome/mpv play-pause              |
|    `super + KP_Right`    | chrome/mpv next                    |
|    `super + KP_Left`     | chrome/mpv previous                |
|        `KP_Right`        | music-player-daemon next           |
|        `KP_Begin`        | music-player-daemon play pause     |
|        `KP_Left`         | music-player-daemon previous       |
|        `KP_Down`         | music-player-daemon volume -2      |
|         `KP_Up`          | music-player-daemon volume +2      |
|         `Print`          | screenshot                         |
|     `shift + Print`      | screenshot select area             |
|    `super + ctrl + 1`    | night light stop                   |
|    `super + ctrl + 2`    | night light temperature 2222       |
|    `super + ctrl + 3`    | night light temperature 3333       |
|    `super + ctrl + 4`    | night light temperature 4444       |

## Dependencies

```shell
  archinstall   # https://www.youtube.com/watch?v=4dKzYmhcGEU

  git clone https://aur.archlinux.org/yay-bin && cd yay-bin && sudo makepkg -si

  yay -S \
    base base-devel brightnessctl broadcom-wl \
    dosfstools dunst \
    exfat-utils \
    gammastep git gnome-keyring grim \
    hyprland \
    intel-ucode \
    linux linux-firmware libnotify \
    mpd mpv-mpris \
    network-manager-applet noto-fonts noto-fonts-emoji ntfs-3g \
    pipewire-pulse playerctl \
    rmpc \
    slurp swaybg \
    visual-studio-code-bin \
    waybar wezterm-nightly-bin wl-clipboard wmenu \
    zathura-pdf-poppler zram-generator zsh

  sudo chsh --shell /bin/zsh $USER

  code --install-extension yeferyv.retronvim
```

## Installation

```shell
  git clone --recursive https://github.com/yeferyv/dotfiles
  ln -s dotfiles/.config/shell/.zprofile ~/.zprofile
```
