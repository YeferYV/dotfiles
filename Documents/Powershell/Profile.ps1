# FAST-WINRICING:
# curl -L get.scoop.sh | pwsh
# scoop install wezterm-nightly lf neovim touchcursor git
# git clonw https://github.com/nvchad/nvchad $HOME/AppData/Local/nvim
# touchcursor

# Change working dir in powershell to last dir in lf on exit.
# You need to put this file to a folder in $ENV:PATH variable.
# You may also like to assign a key to this command:
#
    Set-PSReadLineOption -EditMode Vi
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineKeyHandler -Chord Alt+o -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        #[Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd')
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# pwsh prompt
Invoke-Expression (&starship init powershell)

#
# You may put this in one of the profiles found in $PROFILE.
#
function lfcd {
	$tmp = [System.IO.Path]::GetTempFileName()
	lf -last-dir-path="$tmp" $args
	if (test-path -pathtype leaf "$tmp") {
	      $dir = type "$tmp"
		  remove-item -force "$tmp"
		  if (test-path -pathtype container "$dir") {
		    if ("$dir" -ne "$pwd") {
				  cd "$dir"
		    }
		  }
	}
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
$env:SHELL="pwsh -logo"
$env:EDITOR="nvim"
$env:OPENER="start"
$env:XDG_CONFIG_HOME="$HOME\.config"
# $env:MPV_HOME="$HOME\.config\mpv"
$env:PATH+=";$HOME\.cargo\bin"
$SHELL="pwsh -logo"
$EDITOR="nvim"
$OPENER="start"
$XDG_CONFIG_HOME="$HOME\.config"

Function lf_dir {
  lf -command 'source C:\\Users\\yeste\\.config\\lf\\lfrc'
}

Set-Alias -Name lfdir -Value lf_dir

# function Do-ActualThing {
#     nvim
# }
# Set-Alias n Do-ActualThing
Set-Alias n nvim


