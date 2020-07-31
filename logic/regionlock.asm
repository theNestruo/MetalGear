
;----------------------------------------------------------------------------
;
; Region lock
; Check if the MSX is Japanese
;
; BASVER1:
;
; 7 6 5 4 3 2 1 0
; | | | | +-------- Character set
; | | | |           0 = Japanese, 1 = International, 2=Korean
; | +-------------- Date format
; |                 0 = Y-M-D, 1 = M-D-Y, 2 = D-M-Y
; +---------------- Default interrupt frequency
;                   0 = 60Hz, 1 = 50Hz
;
;
; BASVER2:
;
; 7 6 5 4 3 2 1 0
; | | | | +-------- Keyboard type
; | | | |           0 = Japanese, 1 = International
; | | | |           2 = French (AZERTY), 3 = UK, 4 = German (DIN)
; +---------------- Basic version
;                   0 = Japanese, 1 = International
;----------------------------------------------------------------------------
RegionLock:
	IF (PATCH_RegionLock)
		    ; Metal Gear 1 Dynamic Vsync patch v2 (c) 2011 by FRS
		    ; - Removed the annoying region lock.
		    ;   Now it's possible to play the japanese version on non-japanese machines
		    ; 001322 001331 16    RLE  00000071   00000078 8        00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
		    nop
;		    nop ; (keep the original "ret" because the "call RegionLock" may be kept unpatched)
	ELSE
	if	(JAPANESE)
		ld     hl,(BASVER1)
		ld     a,l
		and    #f7		; Japanese character set? Y-M-D date format? 60Hz?
		jp     nz,#0000   	; No, reset the computer

		ld     a,h
		and    #cf		; Japanese keyboard type?
		jp     nz,#0000   	; No, reset the computer
	ENDIF
	ENDIF
		ret
