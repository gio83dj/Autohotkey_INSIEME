;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;ABBREVIAZIONI;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
::SW::SOFTWARE
::TC::TELECOMANDO
::SX::SINISTRA
::DX::DESTRA
::COV::COVER
::TH::TOUCH
::SP::SPACCATO
::BAT::BATTERIA
::DIS::DISPLAY
::AGG::AGGIORNAMENTO
::grg::giorgio.leggio@gmail.com
;;;;;;;MODALITA' PISTOLA;;;;;;;;;;;;;
;'::-
;-::?
;�::'
 
percentage := "%"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;AUTOCOMPLETAMENTI;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
^ESC::ExitApp 

^WheelUp::Volume_Up

^WheelDown::Volume_Down

^MButton::Volume_Mute

XButton1::
send ^#{Left}
;Send {Volume_Mute}
RETURN

XButton2::
send ^#{Right}
;Send {Volume_Mute}
RETURN

^XButton1::
send ^#{Left}
Send {Volume_Mute}
RETURN

^XButton2::
send ^#{Right}
Send {Volume_Mute}
RETURN

#x::
VARIABILE= CONTROLLARE ACCESSORI - MATRICOLA LETTA DA SCATOLA
gosub INSERISCI 
RETURN

^k::
clipboard = `%0a
;WinMove, server2015 - Connessione Desktop remoto ,,0,0
RETURN

^n::
VARIABILE = NESSUNO
gosub INSERISCI 
return
 
^s::
VARIABILE= SCATOLA.
gosub INSERISCI 
return
 
^b::
VARIABILE= BATTERIA+COVER
gosub INSERISCI 
return
 
^a::
VARIABILE= +ALIMENTATORE
gosub INSERISCI 
return
 
^p::
VARIABILE= PIEDI NON LASCIATO TELECOMANDO 
gosub INSERISCI 
return

^u::
VARIABILE= +CAVO USB
gosub INSERISCI 
return
 
^o::
VARIABILE= +CAVO OTG
gosub INSERISCI 
return
 
^t::
VARIABILE= +TELECOMANDO
gosub INSERISCI 
return
 
^i::
VARIABILE= SCATOLA+BATTERIA+COVER+ALIMENTATORE+CAVO USB
gosub INSERISCI 
return
 
^d::
VARIABILE= DISPLAY ROTTO
gosub INSERISCI 
return
 
^m::
VARIABILE= +MEMORY CARD
gosub INSERISCI 
return
 
#a::
VARIABILE= NO ALTOPARLANTE-
gosub INSERISCI 
return
 
#m::
VARIABILE= NO MICROFONO-
gosub INSERISCI 
return
 
#d::
VARIABILE= DISPLAY DIFETTOSO-
gosub INSERISCI 
return
 
#n::
VARIABILE= NON ACCENDE-
gosub INSERISCI 
return
 
#v::
VARIABILE= NO VIDEO-
gosub INSERISCI 
return
 
#s::
VARIABILE= NON FUNZIONA LA SUONERIA-
gosub INSERISCI 
return
 
#r::
VARIABILE= NON HA RETE/BASSA RICEZIONE-
gosub INSERISCI 
return
 
#e::
VARIABILE= SI SPEGNE SOLO-
gosub INSERISCI 
return
 
#b::
VARIABILE= SI BLOCCA-
gosub INSERISCI 
return
 
#f::
VARIABILE= NON FUNZIONA LA FOTOCAMERA-
gosub INSERISCI 
return
 
#i::
VARIABILE= NON LEGGE LA SIM-
gosub INSERISCI 
return
 
#z::
VARIABILE= RICHIESTA PREVENTIVO-ESAME TECNICO GIA PAGATO 10 EURO
gosub INSERISCI 
return


#t::
VARIABILE= NON FUNZIONA TASTIERA-
gosub INSERISCI 
return
 
#p::
VARIABILE= BATTERIA DURA POCO-
gosub INSERISCI 
return
 
#h::
VARIABILE= NON FUNZIONA TOUCH-
gosub INSERISCI 
return
 
#c::
VARIABILE= NON CARICA LA BATTERIA-
gosub INSERISCI 
return
 
#q::
gosub INIZIA_SCANSIONE
return
 
;^F1::
;FileAppend, 3339282529; , C:\Users\Public\SMS.txt
;FileRead, Clipboard, C:\Users\Public\SMS.txt
;MsgBox, 4,, Questi sono i numeri inseriti, vanno bene?`n`LISTA: %Clipboard%
;IfMsgBox Yes
;{
	;;Filecopy, C:\Users\Public\SMS.txt, \\Pc_sms\inrete\SMS.txt, 1
;	SoundBeep  ; Play the default pitch and duration.

;	Filecopy, C:\Users\Public\SMS.txt, C:\Users\Public\SMS.bkp, 1
;	SoundBeep, 750, 500  ; Play a higher pitch for half a second.

	;;Filedelete, C:\Users\Public\SMS.txt
;	SoundBeep, 100, 1000
;	Run C:\Program Files (x86)\Nokia\Nokia PC Suite 7\CommunicationCentre.exe
;	RETURN
;}
;IfMsgBox No
;{
;	Run C:\Windows\Notepad.exe "C:\Users\Public\SMS.txt"
;	RETURN
;}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;FUNZIONI ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;SALVA SCANSIONE
F1::
gosub COPIA_N_SCHEDA
gosub SALVA_SCANSIONE
clipboard =  
return

;DISATTIVATO 
;SMS ALTRO/SAMS
;^F12::
;gosub COPIA_N_TEL
;gosub AGGIUNGI_LISTA
;gosub SETTA_INVIATO
;gosub INPUT_UBICAZIONE
;RETURN
 
;SMS LIBERO SENZA UBICAZIONE
;^F11::
;gosub COPIA_N_TEL
;gosub AGGIUNGI_LISTA
;gosub SETTA_INVIATO
;Sleep, 700
;Send, {Esc}
;RETURN
 
;SMS RICAMBI
^F8::
gosub INPUT_RICAMBIO
RETURN

;WZP
^F9::
gosub COPIA_N_TEL
gosub INPUT_WZP
RETURN

^1::
SoundBeep  
SoundBeep, 750, 500
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO.  RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30.
Send, {CTRLDOWN}v{CTRLUP}
return

^2::
SoundBeep  
SoundBeep, 750, 500
clipboard = SALVE LE COMUNICHIAMO IL PREVENTIVO PER LA RIPARAZIONE DEL SUO PRODOTTO. EURO (IVATO). CI COMUNICHI RISPOSTA CHIAMANDO ALLO 0932 255855. RADIOFRANCO
Send, {CTRLDOWN}v{CTRLUP}
return

^3::
SoundBeep  
SoundBeep, 750, 500  
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL RICAMBIO DA LEI ORDINATO E' ARRIVATO. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30
Send, {CTRLDOWN}v{CTRLUP}
return

^9::
SoundBeep  
SoundBeep, 750, 500  
clipboard = Gentile cliente, questo account Whatsapp non � pi� utilizzato. Il nuovo account per contattare l'azienda RADIOFRANCO � *(Clicca per aprire)* https://wa.me/3909321846359  [MESSAGGIO AUTOMATICO]
Send, {CTRLDOWN}v{CTRLUP}
return

^0::
SoundBeep  
SoundBeep, 750, 500  
clipboard = Gentile cliente, Le ricordiamo che � possibile controllare lo stato di un apparecchio in lavorazione accedendo al sito www.radiofranco.it e inserendo il CODICE CLIENTE presente sulla ricevuta in vostro possesso. Grazie [MESSAGGIO AUTOMATICO]
Send, {CTRLDOWN}v{CTRLUP}
return

;INVIA WHATSAPP
^F1::
gosub COPIA_N_TEL
gosub SETTA_INVIATO
gosub INPUT_WZP_DIRETTO
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO. SI PREGA DI PORTARE LA RICEVUTA PER IL RITIRO, GRAZIE. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30.
RETURN

;INVIA WHATSAPP
^F11::
gosub COPIA_N_TEL
gosub SETTA_INVIATO
gosub INPUT_WZP_DIRETTO
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO. SI PREGA DI PORTARE LA RICEVUTA PER IL RITIRO, GRAZIE. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30.
RETURN

;INVIA WHATSAPP CON UBICAZIONE
^F12::
gosub COPIA_N_TEL
gosub SETTA_INVIATO
gosub INPUT_UBICAZIONE
gosub INPUT_WZP_DIRETTO
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO. SI PREGA DI PORTARE LA RICEVUTA PER IL RITIRO, GRAZIE. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30.
RETURN

;DISATTIVATO INCOLLA SU NOKIA PC SUITE
;^F3::
;gosub INVIA_MESSAGGI
;FileDelete, C:\Users\Public\SMS.txt
;SoundBeep, 750, 300  ; Play a higher pitch for half a second
;;;FileDelete, C:\Documents and Settings\alex\Desktop\INRETE\SMS.txt
;SoundBeep, 500, 700
;sleep, 500
;SoundBeep, 500, 500
;sleep, 500
;SoundBeep, 500, 500
;sleep, 500
;click
;RETURN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;SUBROUTINE;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
INSERISCI:
clipboard = %VARIABILE%
GOSUB ATTIVA_GESAT
SoundBeep, 740, 100
SoundBeep, 523, 75
Mousemove,  100,  350
send {RButton} 
clipboard =  
SoundBeep, 1480, 100
SoundBeep, 1046, 100
return
 
COPIA_N_SCHEDA:
GOSUB ATTIVA_GESAT
Sleep, 700
Click, 226, 130 Left, Down
Sleep, 700
Click, 268, 130 Left, Up
Sleep, 100
Click, 262, 109 Right, Down
Click, 262, 109 Right, Up
return
 
COPIA_N_TEL:
GOSUB ATTIVA_GESAT
Click, 668, 148 Left, Down
Sleep, 100
Click, 758, 148 Left, Up
Sleep, 100
Click, 765, 148 Right, Down
Click, 765, 148 Right, Up
Sleep, 100
return
 
INIZIA_SCANSIONE:
#WinActivateForce
WinActivate, Not Another PDF Scanner 2
Sleep, 700
Send, {F2}
Sleep, 700
GOSUB ATTIVA_GESAT
Sleep, 700
Sleep, 700
Sleep, 700
GOSUB ATTIVA_GESAT
return
 
SALVA_SCANSIONE:
WinActivate, Not Another PDF Scanner 2
Click, 372, 58 Left, Down
Sleep, 400
Click, 372, 58 Left, Up
Sleep, 400

WinActivate, Saving page(s) ahk_class #32770 ahk_exe PaperScan.exe
;WinActivate, Saving page(s) ahk_class #32770
;CLICCA TASTO DESTRA SU BARRA NOME FILE
Sleep, 2800
Click, 207, 421 Right, Down
Sleep, 500
Click, 207, 421 Right, Up
;SI SPOSTA SOPRA INCOLLA
Sleep, 700
MouseMove, 390, 500
;CLICCA INCOLLA
Sleep, 700
Click, 390, 500 Left, Down
Sleep, 700
Click, 390, 500 Left, Up
;CLICCA SALVA
Sleep, 700
Click, 670, 490 Left, Down
Sleep, 800
Click, 670, 490 Left, Up

WinActivate, Not Another PDF Scanner 2
Sleep, 1900
Click, 926, 55 Left, Down
Click, 926, 55 Left, Up
Sleep, 1900
Send, {RETURN}


GOSUB ATTIVA_GESAT
Return
 
AGGIUNGI_LISTA:
FileAppend, %Clipboard%; , C:\Users\Public\SMS.txt
SoundBeep, 987, 500
return


SETTA_INVIATO:
GOSUB ATTIVA_GESAT
Send, {F6}
Send,  {Down}
Sleep, 250
Send, {NumpadEnter}
Sleep, 500
SoundBeep, 1864, 100
SoundBeep, 1975, 200
GOSUB ATTIVA_GESAT
return

INPUT_RICAMBIO:
SoundBeep, 1244, 300
SoundBeep, 932, 500
InputBox, NumeroTel, Ricambio Arrivato, Inserisci il numero di cellulare del cliente, 320, 240
FileAppend, %NumeroTel%; , C:\Users\Public\SMS.txt
MsgBox, 4, , Altri numeri?
IfMsgBox Yes
    GOSUB INPUT_RICAMBIO
else
    return
return

INPUT_WZP:
SoundBeep, 1244, 300
SoundBeep, 932, 500
InputBox, NumeroTel, Invia Watsapp a NUMERO, Inserisci il numero di cellulare del cliente, 320, 240
FileAppend, %NumeroTel%; , C:\Users\Public\SMS.txt
;Run, open "https://wa.me/39%Clipboard%?text=GENTILE CLIENTE. LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO SI PREGA DI PORTARE LA RICEVUTA --RADIOFRANCO ORARI LUN-VEN 9.00 13.00 -- 16.00 19.00"
Run, open "https://wa.me/39%Clipboard%"
return

INPUT_WZP_DIRETTO:
SoundBeep, 1244, 300
SoundBeep, 932, 500
Run, open "https://wa.me/39%Clipboard%?text=Gentile cliente la informiamo che il suo apparecchio e' *pronto per il ritiro*. `%0a`%0a_Si prega di portare la ricevuta_ `%0a`%0a`%0a*RADIOFRANCO* `%0aORARI DI APERTURA `%0aLUN-VEN `%0a8.45 - 13.00`%0a15.45 - 19.00"
;clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO. SI PREGA DI PORTARE LA RICEVUTA PER IL RITIRO, GRAZIE. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 18.30.
return

INPUT_UBICAZIONE_XX:
SoundBeep, 1244, 300
SoundBeep, 932, 500
InputBox, Ubicazione, Posizione Ubicazione, Inserisci il posto dove sar� ubicato il prodotto, 320, 240
If ErrorLevel{
    MsgBox, ANNULLARE SMS
    return
}else{
GOSUB ATTIVA_GESAT
MouseClick, left,  298,  10
Sleep, 100
Send,  {PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}%Ubicazione%{ENTER}{F10}{RIGHT}{ENTER}
Sleep, 700
Send, {Esc}
return
}

INPUT_UBICAZIONE_NK:
;SoundBeep, 1244, 300
;SoundBeep, 932, 500
;InputBox, Ubicazione, Posizione Ubicazione, Inserisci il posto dove sar� ubicato il prodotto, 320, 240
;GOSUB ATTIVA_GESAT
MouseClick, left,  298,  10
Sleep, 100
Send,  {PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}%Ubicazione%{ENTER}{F10}{RIGHT}{ENTER}
Sleep, 700
Send, {Esc}
return

INPUT_UBICAZIONE_SM:
;SoundBeep, 1244, 300
;SoundBeep, 932, 500
;InputBox, Ubicazione, Posizione Ubicazione, Inserisci il posto dove sar� ubicato il prodotto, 320, 240
;GOSUB ATTIVA_GESAT
MouseClick, left,  298,  10
Sleep, 100
Send,  {PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}%Ubicazione%{ENTER}{F10}{RIGHT}{ENTER}
Sleep, 700
Send, {Esc}
return

INPUT_UBICAZIONE_ER:
;GOSUB ATTIVA_GESAT
MouseClick, left,  298,  10
Sleep, 100
Send,  {PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}%Ubicazione%{ENTER}{F10}{RIGHT}{ENTER}
Sleep, 700
Send, {Esc}
return
 
INPUT_UBICAZIONE:
SoundBeep, 1244, 300
SoundBeep, 932, 500
Text := "Scegli dove verr� ubicato il prodotto."
Result := MagicBox(Text, "Confirm", "&1-Altro|&2-Alcatel|&3-Samsung|&4-Mediacom|&5-LG|&6-SONY|&7-Nokia|&8-Motorola|&9-Tab|&0-Brondi|&Scrivi|Ca&ncel", [29], "", "", 0, 0, "", "", "", "")
	if Result = 1-Altro
	{
		Ubicazione = ALTRO
	}

	if Result = 2-Alcatel
	{
		Ubicazione = ALCATEL
	}

	if Result = 3-Samsung
	{
		Ubicazione = SAMSUNG
		gosub INPUT_UBICAZIONE_SM
		RETURN
	}

	if Result = 4-Mediacom
	{
		Ubicazione = MEDIACOM
	}

	if Result = 5-LG
	{
		Ubicazione = LG
	}

	if Result = 6-SONY
	{	
		Ubicazione = ERICSSON
		gosub INPUT_UBICAZIONE_ER
		RETURN
	}

	if Result = 7-Nokia
	{
		Ubicazione = NOKIA1
		gosub INPUT_UBICAZIONE_NK
		RETURN
	}

	if Result = 8-Motorola
	{
		Ubicazione = MOTOROLA
	}

	if Result = 9-Tab
	{
		Ubicazione = TAB
	}

	if Result = 0-Brondi
	{
		Ubicazione = BRONDI
	}

	if Result = Scrivi
	{
		Ubicazione = 
		gosub INPUT_UBICAZIONE_XX
		RETURN
	}

	if Result = Cancel
	{
		Ubicazione =
		MsgBox, Ubicazione non impostata, ma sms registrato ugualmente.
		return
	}
;MsgBox, %Ubicazione%
If ErrorLevel{
    MsgBox, ANNULLARE SMS
    return
}else{
	;Inserisce ubicazione selezionata
    WinActivate, server2015 - Connessione Desktop remoto ahk_class TscShellContainerClass ahk_exe mstsc.exe
    MouseClick, left,  298,  10
    Sleep, 100
    Send,  {PGDN}{PGDN}{PGDN}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}{UP}%Ubicazione%{ENTER}{F10}{RIGHT}{ENTER}
    Sleep, 700
    Send, {Esc}
    return
}
 
ATTIVA_GESAT:
#WinActivateForce
WinActivate, server2015 - Connessione Desktop remoto ahk_class TscShellContainerClass ahk_exe mstsc.exe
RETURN
 
HIDE:
Send {K} 
Sleep, 10
DllCall("SetCursorPos", int, 1567, int, 10)
;MouseMove, 1567, 0
Click right  
WinMinimizeAll
Send {Volume_Mute} 
GOSUB ATTIVA_GESAT
RETURN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;CODICE MagicBox;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MagicBox(Text, Title := "", Buttons := "", Icon := "", ByRef CheckText := "", Styles := "", Timeout := "", Owner := "", FontOptions := "", FontName := "", BGColor := "", Callback := "") {
    Static hWnd, y2, p, px, pw, c, cw, cy, ch, f, o, gL, hBtn, lb, DHW, ww, Off, k, v, RetVal
    Static Sound := {2: "*48", 4: "*16", 5: "*64"}

    Gui New, hWndhWnd LabelMagic -0xA0000 -DPIScale
    Gui % (Owner) ? "+Owner" . Owner : ""
    Gui Font
    Gui Font, % (FontOptions) ? FontOptions : "s9", % (FontName) ? FontName : "Segoe UI"
    Gui Color, % (BGColor) ? BGColor : "White"
    Gui Margin, 10, 12

    If (IsObject(Icon)) {
        Gui Add, Picture, % "x20 y24 w32 h32 Icon" . Icon[1], % (Icon[2] != "") ? Icon[2] : "shell32.dll"
    } Else If (Icon + 0) {
        Gui Add, Picture, x20 y24 Icon%Icon% w32 h32, user32.dll
        SoundPlay % Sound[Icon]
    }

    Gui Add, Link, % "x" . (Icon ? 65 : 20) . " y" . (InStr(Text, "`n") ? 24 : 32) . " vc", %Text%
    GuicontrolGet c, Pos
    GuiControl Move, c, % "w" . (cw + 30)
    y2 := (cy + ch < 52) ? 90 : cy + ch + 34

    Gui Add, Text, vf -Background ; Footer

    Gui Font
    Gui Font, s9, Segoe UI
    px = 42
    If (CheckText != "") {
        CheckText := StrReplace(CheckText, "*",, ErrorLevel)
        Gui Add, CheckBox, vCheckText x12 y%y2% h26 -Wrap -Background AltSubmit Checked%ErrorLevel%, %CheckText%
        GuicontrolGet p, Pos, CheckText
        px := px + pw + 10
    }

    o := {}
    Loop Parse, Buttons, |, *
    {
        gL := (Callback != "" && InStr(A_LoopField, "...")) ? Callback : "MagicBUTTON"
        Gui Add, Button, hWndhBtn g%gL% x%px% w90 y%y2% h26 -Wrap, %A_Loopfield%
        lb := A_LoopField
        o[hBtn] := px
        px += 98
    }
    GuiControl +Default, % (RegExMatch(Buttons, "([^\*\|]*)\*", Match)) ? Match1 : StrSplit(Buttons, "|")[1]

    Gui Show, Autosize Center Hide, %Title%
    DHW := A_DetectHiddenWindows
    DetectHiddenWindows On
    WinGetPos,,, ww,, ahk_id %hWnd%
    GuiControlGet p, Pos, %lb% ; Last button
    Off := ww - (px + pw)
    For k, v in o {
        GuiControl Move, %k%, % "x" . (v + Off - 14)
    }
    Guicontrol MoveDraw, f, % "x-1 y" . (y2 - 10) . " w" . ww . " h" . 48

    Gui Show
    Gui +SysMenu %Styles%
    DetectHiddenWindows %DHW%

    If (Timeout) {
        SetTimer MagicTIMEOUT, % Round(Timeout) * 1000
    }

    If (Owner) {
        WinSet Disable,, ahk_id %Owner%
    }

    GuiControl Focus, f
    Gui Font
    WinwaitClose ahk_id %hWnd%
    Return RetVal

    MagicESCAPE:
    MagicCLOSE:
    MagicTIMEOUT:
    MagicBUTTON:
        SetTimer MagicTIMEOUT, Delete

        If (A_ThisLabel == "MagicBUTTON") {
            RetVal := StrReplace(A_GuiControl, "&")
        } Else {
            RetVal := (A_ThisLabel == "MagicTIMEOUT") ? "Timeout" : "Cancel"
        }

        If (Owner) {
            WinSet Enable,, ahk_id %Owner%
        }

        Gui Submit
        Gui %hWnd%: Destroy
    Return
}

INVIA_MESSAGGI:
WinWait, Nokia Communication Centre, 
IfWinNotActive, Nokia Communication Centre, , WinActivate, Nokia Communication Centre, 
WinWaitActive, Nokia Communication Centre, 
MouseClick, left,  348,  538
Sleep, 100
WinWait, Nokia Communication Centre - Editor dei messaggi - N93i, 
IfWinNotActive, Nokia Communication Centre - Editor dei messaggi - N93i, , WinActivate, Nokia Communication Centre - Editor dei messaggi - N93i, 
WinWaitActive, Nokia Communication Centre - Editor dei messaggi - N93i, 
;MANDA CONTENUTO FILE SMS
SoundBeep  
SoundBeep, 750, 500
FileRead, Clipboard, C:\Users\Public\SMS.txt
Send, {CTRLDOWN}v{CTRLUP}
MouseClick, left,  327,  244
Sleep, 100
clipboard = GENTILE CLIENTE, LA INFORMIAMO CHE IL SUO APPARECCHIO E' PRONTO PER IL RITIRO. SI PREGA DI PORTARE LA RICEVUTA. RADIOFRANCO ORARI LUN-VEN 9.00 13.00 - 16.00 19.00.
Send, {CTRLDOWN}v{CTRLUP}
MouseMove, 458,  457
Sleep, 100
SoundBeep, 750, 500
SoundBeep  
RETURN

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;GIORGIO LEGGIO;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;