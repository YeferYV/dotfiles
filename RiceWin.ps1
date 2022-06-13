# window manager
# sudo ln -s "$PWD\ahkwm.ahk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"

# WSL
wsl --install

# policies
Set-ExecutionPolicy Bypass -Scope Process

# package manager
iwr -useb get.scoop.sh | iex

# buckets
scoop bucket add main extras games nerd-fonts nirsoft nonportable version

# scoop packages
scoop install `
7zip `
archwsl `
autohotkey-installer `
bat `
bugn `
busybox `
CascadiaCode-NF `
CascadiaCode-NF-Mono `
coreutils `
ffmpeg `
file `
flux `
fzf `
gawk `
gcc `
git `
googlechrome `
gzip `
less `
lf `
lua `
mpv `
mupdf `
neovim `
recycle-bin `
starship `
sudo `
touchcursor `
vcredist2017 `
vscode `
wezterm-nightly `
winbtrfs-np `
windows-terminal `
winrar-np `

# winget packages
winget install --force `
IObit.DriverBooster9 ` 
GWSL `
OpenInWSL `
Microsoft.Powershell `

