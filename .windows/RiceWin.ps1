# WSL:
# wsl --install

# Package Manager:
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# _buckets:
scoop install git # `scoop install busybox` will overwrite git `sh` for lf image preview
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
file `
firacode-NF `
flux `
fzf `
gcc `
kanata `
lazygit `
less `
lf `
make `
mpv `
mupdf `
neovim `
pwsh `
starship `
sudo `
vcredist2022 `
vscode `
wezterm@20230712-072601-f4abf8fd `
yazi `
# 7zip `
# archwsl `
# bugn `
# chafa `
# cmake `
# coreutils `
# ffmpeg `
# gawk `
# go `
# googlechrome `
# gzip `
# lua `
# mingw-winlibs-llvm-ucrt `
# msys2 `
# vcpkg `
# winbtrfs-np `
# windows-terminal `
# winrar `

winget install --force `
google.chrome `
# vscode `
# Elantech `
# IObit.DriverBooster9 `
# GWSL `
# OpenInWSL `
# Microsoft.Powershell `
# LibreOffice `
# Microsoft.VisualStudio.2022.Community # https://github.com/microsoft/vcpkg/issues/22074#issuecomment-1310105006

# Powershell 5 ReadLine:
Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force

# _startups_programs: (.ahk needs `open with` to asociate a launcher)
sudo ln -s "$PWD/ahkwm.ahk"                                        "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp"

# _links:
test ! -e  "$HOME/.config"              && mkdir -p "$HOME/.config"
test ! -e  "$HOME/Documents/Powershell" && mkdir -p "$HOME/Documents/Powershell"
sudo ln -s "$PWD/../.config/kanata"                 "$HOME/.config/"
sudo ln -s "$PWD/../.config/nvim"                   "$HOME/.config/"
sudo ln -s "$PWD/../.config/wezterm"                "$HOME/.config/"
sudo ln -s "$PWD/../.config/mpv"                    "$HOME/AppData/Roaming/"
sudo ln -s "$PWD/AppData/Local/lf"                  "$HOME/AppData/Local"
sudo ln -s "$PWD/Documents/Powershell/profile.ps1"  "$HOME/Documents/Powershell/"
sudo ln -s "$PWD/Documents/Powershell/profile.ps1"  "$HOME/Documents/WindowsPowerShell/"
# sudo ln -s "$PWD/Documents/Powershell/profile.ps1"  $PROFILE.CurrentUserAllHosts
