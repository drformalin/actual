TrayTip, %A_ScriptName% run, latest version!!!, 10
RegExMatch(A_ScriptName, "([A-Z])\w+{1,2}", ReloadKeyIs)
#SingleInstance, force
;UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/actualization.ahk, actualization.ahk
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
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
copy := % Clipboard
WinActivate
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f1>).*?(?=<\/f1>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return


F2::
copy := % Clipboard
clipboard = %A_DD%.%A_MM%.%A_YYYY%
Send, +{Ins}
send, {Space}
Clipboard = %copy%
Return

F3::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f3>).*?(?=<\/f3>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F4::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f4>).*?(?=<\/f4>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F6::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f6>).*?(?=<\/f6>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F7::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f7>).*?(?=<\/f7>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F8::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f8>).*?(?=<\/f8>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return

F9::
copy := % Clipboard
WinActivate
UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/hotact.log, hotact.log
FileRead, OutputVar, hotact.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "(?<=<f9>).*?(?=<\/f9>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Clipboard = %copy%
Return




F12::
Mail := ""

if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$"))
{
	TrayTip, RegExMatch agreed,F12 PROCESSING..., 5

  	;Yar_data .= "EDRPO: " . clipboard . "`r`n"
  	edrpou := clipboard
  	
  	UrlDownloadToFile, https://www.ua-region.com.ua/search/?ko=0&vibor=full.php&q=%edrpou%, region.log
        if not ErrorLevel  ; Successfully loaded.
          	{
		FileRead, OutputVar, region.log
		RegExMatch(OutputVar, "[a-z\@\.\-\_]+@[a-z\@\.\-\_]+(?=<\/a><\/td>)", mail2) ;первая электронка
		MsgBox = % mail2
		Mail .= mail2 . "`r`n"
		FileRead, OutputVar, region.log
		RegExMatch(OutputVar, "(?<a>)[a-z\@\.\_\-]+(?=<\/a> \, \<a)", mail1) ;
        MsgBox = % mail1
        Mail .= mail1
	    	}

	;MsgBox, % Mail
	clipboard = %Mail%
	TrayTip, Yaroslav say... [%is_xml_loaded%] ,`r`nEDRPOU: %edrpou%`r`ne-mail: %Mail%`r`n , 10
}
return


;//*[@id="user1"]/div[2]/dl[2]/dd
F10::
;статус однодата
if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$"))
{
	TrayTip, RegExMatch agreed,F10 PROCESSING..., 5

  	;Yar_data .= "EDRPO: " . clipboard . "`r`n"
  	edrpou := clipboard
  	UrlDownloadToFile, https://odnodata.com/egrpou/%edrpou%, odnodata.log
  	if not ErrorLevel  ; Successfully loaded.
	{
	FileRead, OutputVar, odnodata.log
	RegExMatch(OutputVar, "s)<div class=""info-row"">*.+</div>", Match)   ;section
				;is_xml_loaded:= xpath_load(xml, Match)
				;xdata1:=xpath(xml, "/div[7]/span/text()")
	;Yar_status := xdata1
	Match1 := RegExMatch(OutputVar, "[А-ЯІЇЄ ]+")
	MsgBox, % Match1 ;показывает содержимое
	;MsgBox, % xdata1 ;показывает содержимое, Имя
	}
}
return



F11::

Yar_data := ""

if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$"))
{
	TrayTip, RegExMatch agreed,F11 PROCESSING..., 5

  	;Yar_data .= "EDRPO: " . clipboard . "`r`n"
  	edrpou := clipboard
  	;ФИО однодата
  	UrlDownloadToFile, https://odnodata.com/egrpou/%edrpou%, odnodata.log
  	if not ErrorLevel  ; Successfully loaded.
	{
	FileRead, OutputVar, odnodata.log
	;RegExMatch(OutputVar, "<html>*.+</html>", Match)   ;section
	;RegExMatch(OutputVar, "s)<div class=""cat-uo-info"">*.+</div>", Match)   ;section
	RegExMatch(OutputVar, "s)<div class=""info-row"">*.+</div>", Match)   ;section

				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/div[5]/span/text()")
	;MsgBox, % Match ;показывает содержимое
	;MsgBox, % xdata ;показывает содержимое, Имя
	Yar_name := xdata
	Yar_data .= Yar_name . "`r`n"
}
	;статус однодата
  	UrlDownloadToFile, https://odnodata.com/egrpou/%edrpou%, odnodata.log
  	if not ErrorLevel  ; Successfully loaded.
	{
	FileRead, OutputVar, odnodata.log
	RegExMatch(OutputVar, "s)<div class=""info-row"">*.+</div>", Match)   ;section
				is_xml_loaded:= xpath_load(xml, Match)
				xdata1:=xpath(xml, "/div[7]/span/text()")
	Yar_status := xdata1
	MsgBox, % xdata1 ;показывает содержимое, Имя
	;Yar_data .= Yar_status . "`r`n"
}
	;Номер уабиз
	UrlDownloadToFile, https://uabiz.org/search/?q=%edrpou%, uabiz1.log
	FileRead, OutputVar_uabiz1, uabiz1.log
	if not ErrorLevel  ; Successfully loaded.
	{
	    FileRead, OutputVar_uabiz1, uabiz1.log
	    ; 22575729
	    ; 22575725


	    uabiz1_Pos := RegExMatch(OutputVar_uabiz1, "<ol>*.+</ol>")  ; Returns 4, which is the position where the match was found.

	    if (uabiz1_Pos > 10) {
	    ;MsgBox, % uabiz1_Pos
	   	; 22575729
	    ; 22575725

	    RegExMatch(OutputVar_uabiz1, "<ol>*.+</ol>", Match)   

			is_xml_loaded:= xpath_load(xml, Match) 
			xdata:=xpath(xml, "/ol/li[1]/a/@href")
			StringReplace, xdata, xdata, href=",,All
			StringReplace, xdata, xdata, ",,All

			UrlDownloadToFile, https://uabiz.org%xdata%, uabiz2.log
			if not ErrorLevel ; Successfully loaded.
			{

			    ;MsgBox, uabiz2.log has no ErrorLevel
				FileRead, OutputVar_uabiz2, uabiz2.log
				;RegExMatch(OutputVar_uabiz2, "<html>*.+</html>", Match)   ;section
				;RegExMatch(OutputVar_uabiz2, "s)<dd class=""edit_input"">*.+</dd>", Match)   ;section
				;is_xml_loaded:= xpath_load(xml, Match)
				;xdata:=xpath(xml, "/dd/text()")
				;MsgBox, % xdata ;показывает содержимое, Имя
				;;Clipboard = %Match%
				;Yar_name := xdata
				RegExMatch(OutputVar_uabiz2, "<div class=""info"">*.+<div class=""about-area"">", Match)   ;section
				;MsgBox % Match . ">>>>>>>>>>>>>>>>>>>>>>" 
				;показывает кусок кода в котором нашло сравнение
				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/div/p[1]/text()")
				xdata := RegExReplace(xdata, "\s+" "")
				StringTrimLeft, OutputVar_uabiz2, xdata, StrLen(xdata)-12
				RegExMatch(OutputVar_uabiz2, "[0-9]{5,15}", Match)   ;section

				Uabiz:= Match

				;очистить файл
				Yar_data .= Uabiz . " "

				;
            }
		}

    }
        UrlDownloadToFile, https://youcontrol.com.ua/ru/catalog/company_details/%edrpou%, YouControl.log
	if not ErrorLevel  ; Successfully loaded.
	        {
	        	FileRead, OutputVar, YouControl.log
				RegExMatch(OutputVar, "(?<=<p>)[+0-9 -]+(?=</p>)", Match)
				YouControl:= % Match
				Yar_data .= YouControl . " "
			}
	    UrlDownloadToFile, https://www.ua-region.com.ua/search/?ko=0&vibor=full.php&q=%edrpou%, region.log
        if not ErrorLevel  ; Successfully loaded.
          	{
		FileRead, OutputVar, region.log
		;RegExReplace(var, ";", "`r`n")
   ;RegExReplace(var, "[a-z,& \(\)]+", "")
        RegExMatch(OutputVar, "[0-9]@*.+(?=<\/td><\/tr>)", Match)
        Match1 := RegExReplace(Match, ";", "`r`n")
        Match2 := RegExReplace(Match1, "[a-z,& \(\)]+", "")
        ;is_xml_loaded:= xpath_load(xml, Match)
        Region := % Match2
        ;MsgBox = % Match
        ;StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12
        Yar_data .= Region . " "
	    ;kanatov_data .= "Phone: " . Match . "`r`n"
		;		Clipboard = %Match%
     	;		TrayTip, [%is_xml_loaded%] , Phone: %Match%`r`n, 10
     		}
    ;else is_xml_loaded_t := "Sorry"

	;MsgBox, % Yar_data 
	clipboard = %Yar_data%
	TrayTip, Yaroslav say... [%is_xml_loaded%] ,`r`nEDRPOU: %edrpou%`r`nStatus: %Yar_status%`r`nName: %Yar_name%`r`nUabiz: %Uabiz%`r`nYouControl: %YouControl%`r`nRegion: %Region%`r`n`r`n`r`n , 20
}


Yar_name := ""
Uabiz := ""

return
