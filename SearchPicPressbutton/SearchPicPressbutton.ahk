; Search for pictures on the website and press the button, Copy and paste them


;~ :?*:F11::									
;~ SearchPicPressbutton() {
		;~ inputprog =4LUEDC
		;~ inputtermcode = 200908
        ;~ ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\kanon\Desktop\autoplespdf\programword.png          ; Search for PNG
        ;~ if (ErrorLevel = 2)
            ;~ MsgBox Could not conduct the search.
        ;~ else if (ErrorLevel = 1)
            ;~ MsgBox Image could not be found on the screen.
        ;~ else
        ;~ {
        ;~ ; MsgBox The image was found at %FoundX%x%FoundY%.     
				;~ temp1:=FoundX+20
                ;~ temp2:=FoundY+30
                ;~ temp3:=FoundY+90
                ;~ MouseMove, %temp1%, %temp2%
                ;~ Sleep, 100
                ;~ Click, %temp1%, %temp2% Left, 1
				;~ Sleep, 100
				;~ Send, %inputprog%
				;~ Sleep, 1000
                ;~ MouseMove, %temp1%, %temp3%
                ;~ Sleep, 100
                ;~ Click, Left, 1
				;~ Sleep, 2000
        ;~ }


	;~ loop,              								; Loading site until the specified picture appears
        ;~ {
			;~ ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight,  C:\Users\kanon\Desktop\autoplespdf\loadalready.png
			;~ if !errorlevel {
				;~ ;msgbox, yes
				;~ break 
			;~ }
		;~ }
        ;~ ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\kanon\Desktop\autoplespdf\pdf.png         
        ;~ if (ErrorLevel = 2)
            ;~ MsgBox Could not conduct the search.
        ;~ else if (ErrorLevel = 1)
            ;~ MsgBox Image could not be found on the screen.
        ;~ else
        ;~ {
        ;~ ; MsgBox The image was found at %FoundX%x%FoundY%.  
				;~ Sleep,1000
				;~ temp1:=FoundX+20
                ;~ temp2:=FoundY+20
                ;~ temp3:=FoundY+50
                ;~ MouseMove, %temp1%, %temp2%
                ;~ Sleep, 500
				;~ MouseMove, %temp1%, %temp3%
                ;~ Click, Left, 1
				;~ Sleep,3000
        ;~ }	
		
;~ }