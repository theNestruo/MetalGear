;----------------------------------------------------------------------------
;
; Remove empty slots / Group items and weapons
; Due to a bug it does not work	as expected, but it is only noticiable when droping/using two consecutive items
;
;----------------------------------------------------------------------------

CompactWeapons:
		    ld	    de,	Weapons
		    ld	    b, 6
		    jr	    FindEmptySlot


CompactEquipment:
		    ld	    de,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    ld	    b, 24

FindEmptySlot:
		    ld	    a, (de)
		    and	    a				    ; Empty slot?
		    jr	    z, FindUsedSlot		    ; Yes

		    ld	    a, 4
		    call    ADD_DE_A			    ; Pointer to next item/weapon
		    djnz    FindEmptySlot
		    ret


FindUsedSlot:
		    push    de
		    pop	    hl

FindUsedSlot2:
		    ld	    a, 4
		    call    ADD_HL_A

		    ld	    a, (hl)
		    and	    a				    ; Empty slot?
		    jr	    nz,	MoveItemSlot		    ; No

	IF (PATCH_FindUsedSlot)
		    ; "Metal Gear was designed to group items and weapons in the menu. But due to a bug it does not work.
		    ; Fix: replace #F5 by #F3 at offset #5251"
		    ; https://twitter.com/ManuelPazosMSX/status/920222830582730752
		    djnz	FindUsedSlot2
	ELSE
		    djnz    FindUsedSlot		    ; (!?) The loop should skip	PUSH DE	/ POP HL
	ENDIF
		    ret


MoveItemSlot:
		    push    bc
		    ld	    b, 4

MoveItemSlot2:
		    ld	    a, (hl)
		    ld	    (de), a			    ; Copy item	data to	new location
		    ld	    (hl), 0			    ; Erase item data in old location
		    inc	    hl
		    inc	    de
		    djnz    MoveItemSlot2

		    pop	    bc
		    djnz    FindEmptySlot
		    ret

