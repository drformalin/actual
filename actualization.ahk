TrayTip, %A_ScriptName% run, latest version!!!, 10
RegExMatch(A_ScriptName, "([A-Z])\w+{1,2}", ReloadKeyIs)
#SingleInstance, force
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/actualization.ahk, actualization.ahk
;if ReloadKeyIs
;	Hotkey, %ReloadKeyIs%, ReloadKeyIs
;	else Hotkey, F2, ReloadKeyIs

FileEncoding, UTF-8
IfNotExist, xpath.ahk
{ 
	#SingleInstance, force
	UrlDownloadToFile, https://raw.githubusercontent.com/irungentootoo/AutoHotkey-Scripts/master/xpath.ahk, xpath.ahk
	;ToolTip, looking for xpath.ahk , %MonitorWorkAreaRight%, %MonitorWorkAreaBottom%
}
IfExist, xpath.ahk
{
	Random, rand, 1, 300
	#include xpath.ahk ;(found at http://www.autohotke...h-xpath-syntax/)
	Menu, Tray, Icon, shell32.dll, 24 ; %rand%  ;;;22 ;44 star  ;27 eject ;24 ? ;22 display ;17 printer ;4 folder ;47 update  ;50
}

#SingleInstance, force

#Persistent




F1::
Macro1:
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f1>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return


F2::
;Send, %A_DD%.%A_MM%.%A_YYYY%
clipboard = %A_DD%.%A_MM%.%A_YYYY%
;MsgBox, clipboard
Send, +{Ins}
send, {Space}
Return

F3::
Macro3:
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f3>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F4::
Macro4:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f4>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F6::
Macro6:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f6>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F7::
Macro7:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f7>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F8::
Macro8:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f8>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F9::
Macro9:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f9>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F10::
Macro10:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f10>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return

F12::
Macro12:
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f12>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return




F11::

Yar_data := ""
if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$")){

  	;Yar_data .= "EDRPO: " . clipboard . "`r`n"
  	edrpou := clipboard
  	
	
	UrlDownloadToFile, https://uabiz.org/search/?q=%edrpou%, uabiz1.log
	FileRead, OutputVar, uabiz1.log
	if not ErrorLevel  ; Successfully loaded.
	{
	    FileRead, OutputVar, uabiz1.log
	    RegExMatch(OutputVar, "<ol>*.+</ol>", Match)   
			is_xml_loaded:= xpath_load(xml, Match) 
			xdata:=xpath(xml, "/ol/li[1]/a/@href")
			StringReplace, xdata, xdata, href=",,All
			StringReplace, xdata, xdata, ",,All
			UrlDownloadToFile, https://uabiz.org%xdata%, uabiz2.log
			if not ErrorLevel ; Successfully loaded.
			{
			        
				FileRead, OutputVar, uabiz2.log
				RegExMatch(OutputVar, "<html>*.+</html>", Match)   ;section
				RegExMatch(OutputVar, "s)<dd class=""edit_input"">*.+</dd>", Match)   ;section
				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/dd/text()")
				;MsgBox, % xdata ;показывает содержимое, Имя
				;;Clipboard = %Match%
				Yar_name := xdata
				RegExMatch(OutputVar, "<div class=""info"">*.+<div class=""about-area"">", Match)   ;section
				;MsgBox % Match . ">>>>>>>>>>>>>>>>>>>>>>" 
				;показывает кусок кода в котором нашло сравнение
				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/div/p[1]/text()")
				xdata := RegExReplace(xdata, "\s+" "")
				StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12
				RegExMatch(OutputVar, "[0-9]{5,15}", Match1)   ;section
				Uabiz:= % Match1
				;очистить файл
				Yar_data .= "Phone Uabiz: " . Uabiz . "`r`n"
				;
            }
        UrlDownloadToFile, https://youcontrol.com.ua/ru/catalog/company_details/%edrpou%, YouControl.log
	if not ErrorLevel  ; Successfully loaded.
	        {
	        	FileRead, OutputVar, YouControl.log
				RegExMatch(OutputVar, "(?<=<p>)[+0-9 -]+(?=</p>)", Match)
				YouControl:= % Match
				Yar_data .= "Phone YouControl: " . YouControl . "`r`n"
			}
	    UrlDownloadToFile, https://www.ua-region.com.ua/search/?ko=0&vibor=full.php&q=%edrpou%, region.log
        if not ErrorLevel  ; Successfully loaded.
          	{
		FileRead, OutputVar, region.log
        RegExMatch(OutputVar, "[0-9]@*.+(?=<\/td><\/tr>)", Match)
        ;is_xml_loaded:= xpath_load(xml, Match)
        Region := % Match
        ;MsgBox = % Match
        ;StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12
        Yar_data .= "Phone Region: " . Region . "`r`n"
	    ;kanatov_data .= "Phone: " . Match . "`r`n"
		;		Clipboard = %Match%
     	;		TrayTip, [%is_xml_loaded%] , Phone: %Match%`r`n, 10
     		}
    ;else is_xml_loaded_t := "Sorry"
}
	;MsgBox, % Yar_data 
	clipboard = %Yar_data%
	TrayTip, Yaroslav say... [%is_xml_loaded%] , EDRPOU: %edrpou%`r`nName: %Yar_name%`r`nUabiz: %Uabiz%`r`nYouControl: %YouControl%`r`nRegion: %Region%`r`n , 20
}
return
