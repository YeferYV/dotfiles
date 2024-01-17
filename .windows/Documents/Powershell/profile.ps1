# install ReadLine in powershell 5:
# Install-Module -Name PowerShellGet -Force
# Install-Module PSReadLine -AllowPrerelease -Force

# Change working dir in powershell to last dir in lf on exit.
# You need to put this file to a folder in $ENV:PATH variable.
# You may also like to assign a key to this command:
#
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource History  # Readline Required

Set-PSReadLineKeyHandler -Chord Alt+o -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    #[Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Chord Alt+y -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('y')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadlineKeyHandler -Chord Alt+h -Function ViBackwardChar -ViMode Command # Readline required
Set-PSReadlineKeyHandler -Chord Alt+h -Function ViCommandMode -ViMode Insert   # Readline required

Set-PSReadlineKeyHandler -Chord Alt+j -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Chord Alt+j -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchForward()
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

Set-PSReadlineKeyHandler -Chord Alt+k -Function HistorySearchBackward -ViMode Command
Set-PSReadLineKeyHandler -Chord Alt+k -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::HistorySearchBackward()
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

Set-PSReadlineKeyHandler -Chord Alt+l -Function ViForwardChar -ViMode Command  # Readline required
Set-PSReadLineKeyHandler -Chord Alt+l -ScriptBlock {                           # Readline required
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion()
    [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#
# You may put this in one of the profiles found in $PROFILE.
#
function lfcd {
	lf -print-last-dir $args | Set-Location
  printf "\x1b[A\x1b[K";
}

function y() {
  yazi --cwd-file=$HOME/.yazi;
  cd $(cat $HOME/.yazi);
  printf "\x1b[A\x1b[K";
}

function OnViModeChange {
        if ($args[0] -eq 'Command') {
            # Set the cursor to a blinking block.
            Write-Host -NoNewLine "`e[2 q"
        } else {
            # Set the cursor to a blinking line.
            Write-Host -NoNewLine "`e[6 q"
        }
    }
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $function:OnViModeChange

## To make pulseaudio work on WSL:
## comment the line "load-module module-switch-on-port-available" in the file "C:\Users\yeff\.pulse\default.pa"
## and then run 'pulseaudio --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1'
## then in wsl export PULSE_SERVER... ref: https://www.linuxuprising.com/2021/03/how-to-get-sound-pulseaudio-to-work-on.html
# pulseaudiotest='C:\Users\yeff\Documents\coding\x2goclient-contrib-30b60a6\x2goclient-contrib-30b60a6\13.0-lp151.19.1_bin\pulse\pulseaudio --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1'

## Enviroment variables
# $env:ASD="asd"
# echo $env:ASD
$env:EDITOR="nvim"
$env:OPENER="start"
# $env:SHELL="pwsh" #broke in neovim-open-shell
# $env:PATHEXT=".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL;.SH"
$env:XDG_CONFIG_HOME="$HOME/.config"
# $env:MPV_HOME="$HOME\.config\mpv"
# $env:PATH+=";$HOME\.cargo\bin"
$XDG_CONFIG_HOME="$HOME/.config"

Set-Alias n nvim
Set-Alias ll ls

# pwsh prompt
if (-not (Test-Path "$HOME/.config/starship.toml")) {
  starship config format "(`$battery)(`$sudo)(`$username)(`$directory)(`$git_branch)(`$git_status)(`$cmd_duration)(`$status)(`$character)"
  starship config add_newline false
  starship config cmd_duration.min_time 60000
  starship config directory.style "bold fg:#5555cc"
  starship config directory.truncation_length 9
}
Invoke-Expression (&starship init powershell)
