
Browser_Forward::
   loop,3
   {
      SendInput {LCtrl down}{LWin down}{Right}{LCtrl up}{LWin up}
      Sleep 100
   }
   return

Browser_Back::
   loop, 3
   {
      SendInput {LCtrl down}{LWin down}{Left}{LCtrl up}{LWin up}
      Sleep 100
   }
   return

;https://winaero.com/change-keyboard-repeat-delay-and-rate-in-windows-10
#+z::
  Run, powershell -command "&{set-itemproperty 'HKCU:\Control Panel\Keyboard\' -Name KeyboardDelay -Value 0}"
  Run, powershell -command "&{set-itemproperty 'HKCU:\Control Panel\Keyboard\' -Name KeyboardSpeed -Value 31}"
  return

;https://www.maketecheasier.com/disable-lock-screen-shortcut-key-windows
#^z::Run, powershell -command "&{sudo set-itemproperty HKCU:Software\Microsoft\Windows\CurrentVersion\Policies\System -Name DisableLockWorkstation -value 1 -Force}"

;https://www.reddit.com/r/Windows10/comments/2ze2no/howto_three_finger_swipe_for_desktop_switching/
#!z::
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Two_Finger_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Two_Finger -value 2}"                ;middle_click
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Three_Finger_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Three_Finger -value 2561}"           ;cortana
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Four_Finger_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name Tap_Four_Finger -value 29}"              ;screen_off
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveRight_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveRight_Func -value 2565}"  ;task_switch_right
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveLeft_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveLeft_Func -value 2564}"   ;task_switch_left
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveUp_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveUp_Func -value 2569}"     ;task_switch_open
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveDown_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name ThreeFingerMoveDown_Func -value 2572}"   ;task_switch_close
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveRight_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveRight_Func -value 2574}"   ;desktop_switch_right
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveLeft_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveLeft_Func -value 2575}"    ;desktop_switch_left
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveUp_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveUp_Func -value 3}"         ;browser_forward
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveDown_Enable -value 1}"
    Run, powershell -command "&{set-itemproperty HKCU:Software\Elantech\SmartPad -Name FourFingerMoveDown_Func -value 4}"       ;browser_backward
    return

#q::SendInput {LAlt down}{F4}{LAlt up}                          ;close_window
#a::SendInput {LCtrl down}{Esc}{LCtrl up}                       ;cortana
#e::SendInput {LWin down}{up}{LWin up}                          ;maximize_windows
#d::SendInput {LWin down}{down}{LWin up}                        ;minimize_windows
#s::SendInput {LWin down}{LCtrl down}{Left}{LCtrl up}{LWin up}  ;desktop_switch_right
#f::SendInput {LWin down}{LCtrl down}{Right}{LCtrl up}{LWin up} ;desktop_switch_left
#w::run chrome
#v::run C:\Users\yeste\scoop\apps\wezterm-nightly\current\wezterm-gui.exe start -- pwsh -command "lf && pwsh"
#+v::run C:\Users\yeste\scoop\apps\wezterm-nightly\current\wezterm-gui.exe start -- arch run bash -c "source ~/.zprofile && cd ~ && lf && zsh"
#b::run explorer.exe
#+b::
    IF HideStatusBar := !HideStatusBar
    {
        Run,powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=3;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
    }
    else
    {
        Run,powershell -command "&{$p='HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3';$v=(Get-ItemProperty -Path $p).Settings;$v[8]=2;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
    }

;-- increase/decrease window size (zoom in/out)
#!i::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    X -= 20
    Y -= 10
    W += 40
    H += 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return
#!o::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    X += 20
    Y += 10
    W -= 40
    H -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

;-- hover window to /left/down/up/right
#!+u::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , -7, 0, 697, 775
    return
#!+i::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , -7, 383, 1380, 391
    return
#!+o::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , -7, 0, 1380, 391
    return
#!+p::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , 675, 0, 698, 775
    return

;-- move window by 20px
#!h::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    X -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!j::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    Y += 20
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!k::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    Y -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!l::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    X += 20
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

;-- hover window to corner
#!+h::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    X = -7
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!+j::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    Y := 773 - H
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!+k::
    winget, active_id, ID, A
    wingetpos, X, Y, , , A  ; "A" to get the active window's pos.
    Y = 0
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

#!+l::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    X := 1373 - W
    winmove, ahk_id %active_id%, , %X%,%Y%
    return

;-- increase/expand/grow window edges
#!m::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    W += 20
    X -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!VKBC::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    H += 20
    Y -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!VKBE::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    H += 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!VKBF::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    W += 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

;-- decrease/shrink/ window edges
#!+m::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    W -= 20
    X += 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!+VKBC::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    H -= 20
    Y += 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!+VKBE::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    H -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

#!+VKBF::
    winget, active_id, ID, A
    wingetpos, X, Y, W, H, A  ; "A" to get the active window's pos.
    W -= 20
    winmove, ahk_id %active_id%, , %X%,%Y%,%W%,%H%
    return

;-- xdo fixedscreen 50%/75% (small/medium)
#!n::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , , , 800, 600
    return
#!+n::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , , , 600, 400
    return

;-- xdo fixedscreen 1366x768 (min-max window)
#n::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, ,-7,0, 1380, 773
    return
#+n::
    winget, active_id, ID, A
    winmove, ahk_id %active_id%, , 200, 15, 1155, 743
    return

;#+enter::run c:\users\yeste\scoop\apps\alacritty\current\alacritty.exe -e arch, \\wsl$\arch\home\drksl\docs
#enter::run c:\users\yeste\scoop\apps\wezterm-nightly\current\wezterm-gui.exe,,max
#+enter::run c:\users\yeste\scoop\apps\wezterm-nightly\current\wezterm-gui.exe
#^enter::run c:\users\yeste\scoop\apps\wezterm-nightly\current\wezterm-gui.exe start -- arch ,,max ;arch config --default-user drksl
!enter::run c:\users\yeste\scoop\apps\windows-terminal\current\wt.exe pwsh -nologo, c:\users\yeste
^enter::run c:\users\yeste\scoop\apps\alacritty\current\alacritty.exe -e pwsh -nologo, c:\users\yeste

wheelright::
    send ^{tab}
    sleep 500
    return
wheelleft::
    send ^+{tab}
    sleep 500
    return

;>!j::send {left}
;>!k::send {down}
;>!l::send {right}
;>!i::send {up}
;>!+j::send +{left}
;>!+k::send +{down}
;>!+l::send +{right}
;>!+i::send +{up}
;>!s::send {home}
;>!d::send {end}
;>!+s::send {home}
;>!+d::send {end}
<!e::sendinput {wheelup}
<!d::sendinput {wheeldown}
<!s::send ^+{tab}
<!f::send ^{tab}

ralt::send {rshift down}
ralt up::send % (a_priorkey = "ralt") ? "{rshift up}{ralt up}{bs}" : "{rshift up}{ralt up}"
;lwin & ralt::sendinput {lwin down}{lalt down}{lalt up}{lwin up} ;notworking
;ralt & space::send {enter}
;ralt & lalt::send ^{z}

lwin::lwin
;$~lwin up::send % instr(a_priorkey, "lwin") ? "{lbutton}" : "{lwin up}"
lwin up::
  if instr(a_priorkey, "lwin")
    send {lbutton}
  send {lwin up}
  return

;lalt::lalt
$~lalt up::send % instr(a_priorkey, "lalt") ? "{mbutton}" : "{lalt up}"
;lalt up::
;  if instr(a_priorkey, "lalt")
;    send {mbutton}
;  send {lalt up}
;  return

;capslock::send {lctrl down}
;capslock up::send % (a_priorkey = "capslock ") ? "{lctrl up}{capslock up}{esc}" : "{lctrl up}{capslock up}"
capslock::lctrl
appskey::rctrl
vke2::\
numpadins::space
numpadend::c
numpadleft::controlsend,, {<}, ahk_exe mpv.exe
numpadright::controlsend,, {>}, ahk_exe mpv.exe
numpadclear::controlsend,, {space}, ahk_exe mpv.exe
numpaddown::controlsend,, {/}, ahk_exe mpv.exe
numpadup::controlsend,, {*}, ahk_exe mpv.exe
#numpadleft::controlsend,, {p}, ahk_exe vlc.exe
#numpadright::controlsend,, {n}, ahk_exe vlc.exe
#numpadclear::controlsend,, {space}, ahk_exe vlc.exe
#numpaddown::controlsend,, {down}, ahk_exe vlc.exe
#numpadup::controlsend,, {up}, ahk_exe vlc.exe
numpaddel::volume_down
numpadenter::volume_up

