# Change working dir in powershell to last dir in lf on exit.
#
# You need to put this file to a folder in $ENV:PATH variable.
#
# You may also like to assign a key to this command:
#
    Set-PSReadLineOption -EditMode Vi
    Set-PSReadLineKeyHandler -Chord Alt+o -ScriptBlock {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        #[Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd')
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }

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

# function Do-ActualThing {
#     nvim
# }
# Set-Alias n Do-ActualThing
Set-Alias n nvim
Set-Alias solc solcjs
