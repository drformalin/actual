FileEncoding, UTF-8
TrayTip, %A_ScriptName% run, latest version!!!, 10
RegExMatch(A_ScriptName, "([A-Z])\w+{1,2}", ReloadKeyIs)
#SingleInstance, force


;UrlDownloadToFile, https://raw.githubusercontent.com/drformalin/actual/master/actualization.ahk, actualization.ahk



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



F1::Send, Актуалізація
F2::Send, %A_DD%.%A_MM%.%A_YYYY%
F3::Send, %A_DD%.%A_MM%.%A_YYYY% Немає відповіді
F4::Send, %A_DD%.%A_MM%.%A_YYYY% Збій
F6::Send, %A_DD%.%A_MM%.%A_YYYY% Немає номера
F7::Send, %A_DD%.%A_MM%.%A_YYYY% Не вірний номер
F8::Send, %A_DD%.%A_MM%.%A_YYYY% Не користується газом
F9::Send, %A_DD%.%A_MM%.%A_YYYY% Організація припинила діяльність
F10::Send, %A_DD%.%A_MM%.%A_YYYY% Користується централізованим опаленням









F11::

Yar_data := ""

if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$"))
{
	TrayTip, RegExMatch agreed,F11 PROCESSING..., 5

  	;Yar_data .= "EDRPO: " . clipboard . "`r`n"
  	edrpou := clipboard
  	;статус и имя однодата
  	
  	;Номер уабиз
	UrlDownloadToFile, https://uabiz.org/search/?q=%edrpou%, uabiz1.log
	FileRead, OutputVar_uabiz1, uabiz1.log
	if not ErrorLevel  ; Successfully loaded.
	{
	    FileRead, OutputVar_uabiz1, uabiz1.log
	    uabiz1_Pos := RegExMatch(OutputVar_uabiz1, "<ol>*.+</ol>")  ; Returns 4, which is the position where the match was found.
	    if (uabiz1_Pos > 10) {
	    RegExMatch(OutputVar_uabiz1, "<ol>*.+</ol>", Match)   

			is_xml_loaded:= xpath_load(xml, Match) 
			xdata:=xpath(xml, "/ol/li[1]/a/@href")
			StringReplace, xdata, xdata, href=",,All
			StringReplace, xdata, xdata, ",,All
			UrlDownloadToFile, https://uabiz.org%xdata%, uabiz2.log
			if not ErrorLevel ; Successfully loaded.
			{
			    FileRead, OutputVar_uabiz2, uabiz2.log
				RegExMatch(OutputVar_uabiz2, "<html>*.+</html>", Match)   ;section
				;RegExMatch(OutputVar_uabiz2, "s)<dd class=""edit_input"">*.+</dd>", Match)   ;section
				;is_xml_loaded:= xpath_load(xml, Match)
				;xdata:=xpath(xml, "/dd/text()")
				;MsgBox, % xdata ;показывает содержимое, Имя
				;Yar_name := xdata
				RegExMatch(OutputVar_uabiz2, "<div class=""info"">*.+<div class=""about-area"">", Match)   ;section
				;MsgBox % Match . ">>>>>>>>>>>>>>>>>>>>>>" 
				;показывает кусок кода в котором нашло сравнение
				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/div/p[1]/text()")
				xdata := RegExReplace(xdata, "\s+" "")
				StringTrimLeft, OutputVar_uabiz2, xdata, StrLen(xdata)-12
				RegExMatch(OutputVar_uabiz2, "[0-9]{5,15}", Match)   ;section
				Uabiz := Match
				Yar_data .= Uabiz . " "
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
		RegExMatch(OutputVar, "[0-9]@*.+(?=<\/td><\/tr>)", Match)
        Match1 := RegExReplace(Match, ";", "`r`n")
        Match2 := RegExReplace(Match1, "[a-z,& \(\)]+", "")
        Region := % Match2
        Yar_data .= Region . " "
     		}
	clipboard = %Yar_data%
	TrayTip, Yaroslav say... [%is_xml_loaded%] ,`r`nEDRPOU: %edrpou%`r`nStatus: %cat_uo_info_is_redistred%`r`nName: %cat_uo_info_name%`r`nUabiz: %Uabiz%`r`nYouControl: %YouControl%`r`nRegion: %Region%`r`n`r`n`r`n , 20
}
Uabiz := ""

return

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

