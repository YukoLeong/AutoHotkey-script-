; ----------Batch execution the website and download the file------------------

Menu, Tray, Icon, C:\Windows\system32\imageres.dll,264      ; C:\Windows\system32\shell32.dll
#SingleInstance Force           ; Skips the dialog box and replaces the old instance automatically.
SetWorkingDir, %A_ScriptDir%

F12::							
LoadMF12() {
	;~ alist := StrSplit("4LDDC/4LDNC/4LUEDC/4LVEDC/MIART" , "/")				; AR
	;~ blist := StrSplit("201908/201008/200908/201008/201908" , "/")				; AR
	;~ alist := StrSplit("4LACDI/4LEDI/4LGDI/4LGNC/4LGNI/4LGRDC/4LGRMDC" , "/")			;BU1
	;~ blist := StrSplit("201008/201008/201008/201808/201008/201008/201608" , "/")			;BU1
	;~ alist := StrSplit("4LGRMDI/4LGRMFC/4LGRMNC/4LGRNC/4LMKTDI/4LPRNI/MGRM" , "/")			;BU2
	;~ blist := StrSplit("201608/202008/201608/201008/201008/201008/201908" , "/")			;BU2
	;~ alist := StrSplit("4LCDIU/4LCDIU/4LCPCU/MDATAM/PCOM/4LBMADCI/4LBMFDCI/4LCEDCI/4LCEDCI/4LTLDCI/MNUS" , "/")			;BU2
	;~ blist := StrSplit("201208/201608/201508/201908/201908/201108/201108/201308/201808/201708/201908" , "/")			;BU2	
	;~ alist := StrSplit("4LADCU/4LANPU/4LWDCU/4LWNCU/PPPO/4LCD-C/4LCD-E/4LLCID/4LLCIN/4LLD-C/4LLD-C/4LLD-P" , "/")			;HT,LT
	;~ blist := StrSplit("201008/201008/201008/201008/201908/201608/201608/201008/201008/201008/201708/201008/" , "/")			;HT,LT
	;~ alist := StrSplit("4LLD-P/4LLN-C/4LLN-C/4LLN-P/4LLN-P/4LPDP/BY-CLP/BY-CLP/LL-IPL/MTICP/PKU-CLP/PPORT/4LADC" , "/")			;HT,LT
	;~ blist := StrSplit("201708/201008/201708/201008/201708/201708/201208/201608/201108/201908/201408/201908/201008/" , "/")			;HT,LT	
	alist := StrSplit("4LANP/4LCDI/4LCDI/4LCPC/4LWDC/4LWNC/MDATA/4LFDC/4LFNC/MSPT/4LBMADCIU/4LBMFDCIU/4LCEDCIU/4LCEDCIU/4LFDCU/4LFNCU/4LTLDCIU/MNUSM/MSPTM" , "/")			;PE,SD
	blist := StrSplit("201008/201208/201608/201508/201008/201008/201908/200908/200908/201908/201108/201108/201308/201808/200908/200908/201708/" , "/")			;PE,SD
	Loop, % alist.Length()
	{
	;~ ;send, % alist[A_Index]"_"blist[A_Index]
	;~ ;msgbox, % alist[A_Index] " "  blist[A_Index]

	site := "https://yoursite.com/j_username=superuser&j_password=superuser&output=pdf&Para_Program2=AAA&Para_Termcode2=BBB"
	newsite :=RegExReplace(site,"AAA",alist[A_Index] )
	newsite :=RegExReplace(newsite,"BBB",blist[A_Index] )
	; msgbox, %newsite%
	run, %newsite%

	loop,              
        {
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight,  D:\Dropbox\kanon\ahk env\autoplespdf\loadpdffinish.png
			if !errorlevel {
				;msgbox, yes
				break 
			}
		}		
	;msgbox, ok
		Sleep,500
		Send, {Ctrl down}s{Ctrl up} 						; Save file
		Sleep,1000
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, D:\Dropbox\kanon\ahk env\autoplespdf\filename.png         ; Paste your filename PNG for automatic batch rename
        if (ErrorLevel = 2)
            MsgBox Could not conduct the search.
        else
        {
				Sleep,1000
				temp1:=FoundX+90
                temp2:=FoundY+15
                temp3:=FoundY+50
                MouseMove, %temp1%, %temp2%
                Sleep, 500
                Click, Left, 1
				Send, {Ctrl down}a{Ctrl up} 
				sleep,100
				Send,{Backspace}
				sleep,200
				Send, % alist[A_Index]"_"blist[A_Index]
				sleep,200
        }
        ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, D:\Dropbox\kanon\ahk env\autoplespdf\savebutton.png     ; Paste your save button PNG for automatic batch rename
        if (ErrorLevel = 2)
            MsgBox Could not conduct the search.
        else
        {
				Sleep,100
				temp1:=FoundX+20
                temp2:=FoundY+15
                temp3:=FoundY+50
                MouseMove, %temp1%, %temp2%
                Sleep, 100
                Click, Left, 1
				Sleep,500
				Send, {Ctrl down}w{Ctrl up} 
				Sleep, 1000
        }			
	}
}

