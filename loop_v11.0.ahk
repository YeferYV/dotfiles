
Browser_Forward::  ;Browser_Forward regedit_hexadecimal=4
   loop,3
   {
      SendInput {LCtrl down}{LWin down}{Right}{LCtrl up}{LWin up}
      Sleep 100
   }
   return

Browser_Back::     ;Browser_Back regedit_hexadecimal=3
   loop, 3
   {
      SendInput {LCtrl down}{LWin down}{Left}{LCtrl up}{LWin up}
      Sleep 100
   }
   return
   
;Turn_screen_off regedit_hexadecimal=1d
;#a::SendInput {LWin down}{m}{LWin up} 	           				;actioncenter         regedit_hexadecimal=a02==2b
;#s::SendInput {LCtrl down}{w}{LCtrl up} 		               	;cortana              regedit_hexadecimal=a01==1a
;#d::SendInput {LCtrl down}{w}{LCtrl up}      					;min_maximize         regedit_hexadecimal=a0c==19
#q::SendInput {LAlt down}{F4}{LAlt up} 	           				;actioncenter         regedit_hexadecimal=a02==2b
#a::SendInput {LCtrl down}{Esc}{LCtrl up} 	           				;actioncenter         regedit_hexadecimal=a02==2b
#e::SendInput {LWin down}{up}{LWin up}      					;maximize_windows
#d::SendInput {LWin down}{down}{LWin up}      					;min_windows
#s::SendInput {LWin down}{LCtrl down}{Left}{LCtrl up}{LWin up}  ;desktop_switch_right regedit_hexadecimal=a0e
#f::SendInput {LWin down}{LCtrl down}{Right}{LCtrl up}{LWin up} ;desktop_switch_left  regedit_hexadecimal=a0f
#c::run chrome
#v::run alacritty.exe -e lf, C:\Users\yeff
#b::run alacritty.exe -e arch run lf /home/yeff
;#n::run arch run ranger /mnt/c/Users/yeff
#n::
   WinGet, active_id, ID, A
   WinMove, ahk_id %active_id%, , 200, 15, 1155, 743
   return
#j::
   WinGet, active_id, ID, A
   WinMove, ahk_id %active_id%, , -7, 0, 697, 775
   return
#k::
   WinGet, active_id, ID, A
   WinMove, ahk_id %active_id%, , -7, 383, 1380, 391
   return
#l::
   WinGet, active_id, ID, A
   WinMove, ahk_id %active_id%, , -7, 0, 1380, 391
   return
#VKBA::
   WinGet, active_id, ID, A
   WinMove, ahk_id %active_id%, , 675, 0, 698, 775
   return
#m::run explorer.exe
^enter::run alacritty.exe -e arch run source ~/.zprofile && bash, \\wsl$\Arch_Linux\home\yeff
#enter::run alacritty.exe -e arch
!enter::run alacritty.exe -e Powershell -NoLogo, C:\Users\yeff

WheelRight::
   Send ^{Tab}
   Sleep 500
   return
WheelLeft::
   Send ^+{Tab}
   Sleep 500
   return

>!j::Send {Left}
>!k::Send {Down}
>!l::Send {Right}
>!i::Send {Up}
>!+j::Send +{Left}
>!+k::Send +{Down}
>!+l::Send +{Right}
>!+i::Send +{Up}
>!s::Send {Home}
>!d::Send {End}
>!+s::Send {Home}
>!+d::Send {End}	
<!e::SendInput {WheelUp}
<!d::SendInput {WheelDown} 
<!s::Send ^+{tab} 
<!f::Send ^{tab}

#+j::
    WinGet, active_id, ID, A
    WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
    X -= 20
    WinMove, ahk_id %active_id%, , %X%,%Y%
    return

#+k::
    WinGet, active_id, ID, A
    WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
    Y += 20
    WinMove, ahk_id %active_id%, , %X%,%Y%
    return

#+l::
    WinGet, active_id, ID, A
    WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
    Y -= 20
    WinMove, ahk_id %active_id%, , %X%,%Y%
    return

#+VKBA::
    WinGet, active_id, ID, A
    WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
    X += 20
    WinMove, ahk_id %active_id%, , %X%,%Y%
    return

RAlt::Send {BS}
Ralt & space::Send {enter}
RAlt & LAlt::Send ^{z} 
LWin::LWin

;$~LWin up::send % instr(A_PriorKey, "LWin") ? "{LButton}" : "{LWin up}"
LWin up::
  if instr(A_PriorKey, "LWin")
    send {LButton}
  send {LWin up}
  return 

;LAlt::LAlt
$~LAlt up::send % instr(A_PriorKey, "LAlt") ? "{MButton}" : "{LAlt up}"
;LAlt up::
;  if instr(A_PriorKey, "LAlt")
;    send {MButton}
;  send {LAlt up}
;  return 

AppsKey::RWin
VKE2::\
NumpadIns::Space
NumpadDown::c
NumpadLeft::ControlSend,, {p}, ahk_exe vlc.exe
NumpadRight::ControlSend,, {n}, ahk_exe vlc.exe
NumpadClear::ControlSend,, {space}, ahk_exe vlc.exe
NumpadHome::ControlSend,, {down}, ahk_exe vlc.exe
NumpadPgUp::ControlSend,, {up}, ahk_exe vlc.exe
NumpadDel::Volume_Down
NumpadEnter::Volume_up


