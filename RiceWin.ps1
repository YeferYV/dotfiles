# WSL:
# wsl --install

# _policies:
# Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# _package_manager:
# iwr -useb get.scoop.sh | iex
irm get.scoop.sh | iex

# _buckets:
scoop install git
scoop bucket add main
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add nonportable
scoop bucket add versions
# scoop bucket add games
# scoop bucket add nirsoft

# _scoop_packages:
scoop install `
3270-NF `
autohotkey1.1 `
bat `
busybox `
CascadiaCode-NF `
CascadiaCode-NF-Mono `
file `
flux `
fzf `
gcc `
googlechrome `
lazygit `
less `
lf `
make `
mpv `
mupdf `
neovim `
pwsh `
recycle-bin `
starship `
sudo `
touchcursor `
vcredist2022 `
vscode `
wezterm-nightly `
# 7zip `
# archwsl `
# bugn `
# chafa `
# cmake `
# coreutils `
# ffmpeg `
# gawk `
# go `
# gzip `
# lua `
# mingw-winlibs-llvm-ucrt `
# msys2 `
# vcpkg `
# winbtrfs-np `
# windows-terminal `
# winrar `

# _winget_packages:
# winget install --force `
# Elantech `
# IObit.DriverBooster9 `
# GWSL `
# OpenInWSL `
# Microsoft.Powershell `
# LibreOffice `
# Microsoft.VisualStudio.2022.Community # https://github.com/microsoft/vcpkg/issues/22074#issuecomment-1310105006

# _startups_programs:
sudo ln -s "$PWD/ahkwm.ahk"                                        "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"
sudo ln -s "$HOME/scoop/apps/flux/current/flux.exe"                "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"
sudo ln -s "$HOME/scoop/apps/touchcursor/current/touchcursor.exe"  "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"

# _links:
test ! -e  "$HOME/.config"              && mkdir -p "$HOME/.config"
test ! -e  "$HOME/Documents/Powershell" && mkdir -p "$HOME/Documents/Powershell"
sudo ln -s "$PWD/.config/wezterm"                   "$HOME/.config/"
sudo ln -s "$PWD/wslfiles/.config/nvim"             "$HOME/.config/"
sudo ln -s "$PWD/AppData/Local/lf"                  "$HOME/AppData/Local"
sudo ln -s "$PWD/AppData/Roaming/TouchCursor"       "$HOME/AppData/Roaming/"
sudo ln -s "$PWD/AppData/Roaming/mpv"               "$HOME/AppData/Roaming/"
sudo ln -s "$PWD/Documents/Powershell/profile.ps1"  "$HOME/Documents/Powershell/"
# sudo ln -s "$PWD/Documents/Powershell/profile.ps1"  $PROFILE.CurrentUserAllHosts
