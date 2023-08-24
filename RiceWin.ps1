# _startups_programs:
# sudo ln -s "$PWD\ahkwm.ahk"     "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
# sudo ln -s "$PWD\toucursor.exe" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
# sudo ln -s "$PWD\flux.exe"      "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

# WSL:
# wsl --install

# _policies:
Set-ExecutionPolicy Bypass -Scope Process

# _package_manager:
iwr -useb get.scoop.sh | iex

# _buckets:
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
archwsl `
autohotkey1.1 `
bat `
busybox `
CascadiaCode-NF `
CascadiaCode-NF-Mono `
chafa `
file `
flux `
fzf `
gcc `
git `
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
# bugn `
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
