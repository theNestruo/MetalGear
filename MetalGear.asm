;----------------------------------------------------------------------------
;
; Metal	Gear (RC750)
;
; Copyright Konami 1987
;
;----------------------------------------------------------------------------
;
; Main Program:
;	Hiroyuki Fukui
;
; Sub Program:
;	Tomonori Otsuka
;	Koji Toyohara
;
; Graphic Design:
;	Masami Tabata
;	Azusa Fujimoto
;
; Main Sound Effect:
;	Iku Mizutani
;
; Subsound Effect:
;	Shigehiro Takenouchi
;	Motoaki Furukawa
;
; Game Design:
;	Hideo Kojima
;
;----------------------------------------------------------------------------
;
; Disassembled by Manuel Pazos 2017
; @ManuelPazosMSX
;
;----------------------------------------------------------------------------


JAPANESE	equ	0	; 1 = Japanese version, 0 = English version


; Metal Gear 1 Dynamic Vsync patch v2
; (c) 2011 by FRS
; http://frs.badcoffee.info/patches.html

; - TAB : throttle game speed

; - SPACE : speed up text dialogs, now works like Metal Gear-2
PATCH_TW_Wait	equ 1

; - Automatically sets the VDP to 60Hz on boot, to play the game at the correct
;   speed even on european machines. If you have an old european TV that doesn't
;   support this, keep SELECT pressed on boot to disable it.

; - Removed the annoying region lock.
;   Now it's possible to play the japanese version on non-japanese machines
PATCH_RegionLock	equ 1

; - Enhanced sprite cycling: if you have a turbo machine, the sprite cycling
;   routine will take advantage of that and the flickering of the sprites will
;   occur at a higher framerate.

; - Improved graphics for the moving parts of the bridge. They now match the
;   non-moving pieces better.
PATCH_ActorSprColors2	equ 1


; "Metal Gear was designed to group items and weapons in the menu. But due to a bug it does not work.
; Fix: replace #F5 by #F3 at offset #5251"
; https://twitter.com/ManuelPazosMSX/status/920222830582730752
PATCH_FindUsedSlot	equ 1


; "Otra curiosidad del Metal Gear. Todo apunta a que, inicialmente,
; varios tipos de soldado podían dejar munición o comida, al darles tres puñetazos.
; Pero por un cambio de última hora, o un fallo, solo los que andan lento lo hacen."
; https://twitter.com/manuelpazosmsx/status/1037027943120285696
PATCH_ChkDropItem	equ 1


;----------------------------------------------------------------------------
;
; Includes
;
;----------------------------------------------------------------------------

		include	"constants/bios.asm"
		include	"constants/SystemVariables.asm"
		include	"constants/structures.asm"
		include	"constants/Enums.asm"
		include	"Variables.asm"


;----------------------------------------------------------------------------
;
; Banks
;
;----------------------------------------------------------------------------

		include	"Banks0123.asm"
		include	"Banks456.asm"
		include	"Banks789.asm"
		include	"BanksABC.asm"
		include	"BanksDEF.asm"

		end