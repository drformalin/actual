TrayTip, %A_ScriptName% run, latest version!!!, 10
RegExMatch(A_ScriptName, "([A-Z])\w+{1,2}", ReloadKeyIs)
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
WinActivate
FileRead, OutputVar, hot.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f1>)", Match)
		;RegExMatch(OutputVar, "<f1>*.+</f1>", Match)   ;section искать совпадения
		;is_xml_loaded:= xpath_load(xml, Match)
		;xdata:=xpath(xml, "f1/text()")
		;xdata := RegExReplace(xdata, "\s+" "")
		;StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12 ;вывод?
		;RegExMatch(OutputVar, "[А-Яа-їЇІ ]+", Match)   ;section
		Clipboard = %Match%
		;Clipboard = %xdata%
	}
Send, ^{vk56}
Return


F2::
data := A_DD.A_MM.A_YYYY
Clipboard = %data%
Send, ^{vk56}

F3::
Macro3:
WinActivate
FileRead, OutputVar, hot.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		;RegExMatch(OutputVar, "<f3>*.+</f3>", Match)   ;section искать совпадения
		RegExMatch(OutputVar, "@*.+(?=</f3>)", Match)   ;section искать совпадения
		;RegExMatch(OutputVar, "<f3>[А-Яа-їЇІ ]+</f3>", Match)   ;section искать совпадения
		;is_xml_loaded:= xpath_load(xml, Match)
		;xdata:=xpath(xml, "f1/text()")
		;xdata := RegExReplace(xdata, "\s+" "")
		;StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12 ;вывод?
		;RegExMatch(OutputVar, "[А-Яа-їЇІ ]+", Match)   ;section
		Clipboard = %Match%
		;Clipboard = %xdata%
	}
Send, ^{vk56}
Return

F4::
Macro4:
WinActivate
FileRead, OutputVar, hot.log
if not ErrorLevel  ; Successfully loaded.
	{
		data := OutputVar
		RegExMatch(OutputVar, "@*.+(?=</f4>)", Match)
		Clipboard = %Match%
		}
Send, ^{vk56}
Return



F6::
kanatov_data := ""
  if (RegExMatch(clipboard, "i)^[0-9]{8}$|^[0-9]{10}$|^[0-9]{12}$")){

  	kanatov_data .= "EDRPO: " . clipboard . "`r`n"
  	kanatov_data_clipboard := clipboard

	;UrlDownloadToFile, https://youcontrol.com.ua/ru/catalog/company_details/?q=%clipboard%, rbuff_stage1.log
	UrlDownloadToFile, https://youcontrol.com.ua/ru/catalog/company_details/22575729, rbuff_stage1.log
	FileRead, OutputVar, rbuff_stage1.log
  if not ErrorLevel  ; Successfully loaded.
	{
				RegExMatch(OutputVar, "<tbody>*.+</tbody>", Match)   ;section искать совпадения
				is_xml_loaded:= xpath_load(xml, Match)
				xdata:=xpath(xml, "/tbody/tr[7]/td[2]/p/text()")
				;x := "//*[@id=""tab-catalog""]/div/div[1]/table/tbody/tr[7]/td[2]/p/text()"
				;xdata := xpath(xml, x)
				xdata := RegExReplace(xdata, "\s+" "")
				StringTrimLeft, OutputVar, xdata, StrLen(xdata)-12
				RegExMatch(OutputVar, "[0-9]{5,12}", Match)   ;section


				kanatov_data .= "Phone: " . Match . "`r`n"
				Clipboard = %Match%
     			TrayTip, [%is_xml_loaded%] , Phone: %Match%`r`n, 10
     		}
}
return
