.3ds
.arm

.open "code.bin", "code_patched.bin", 0x100000

; GetFriendAttributes
.org 0x11b8bc
    stmdb sp!, { r2, r3, lr }
    mov r3, #3
    friend_attribute_loop:
        str r3, [r0, #0x00]
        sub r2, r2, #0x1
        cmp r2, #0x0
        add r0, r0, #0x4
        bne friend_attribute_loop
    
    mov r0, 0x0
    ldmia sp!, { r2, r3, pc }

; GetFriendKeyList
.org 0x11b814
.area 0x60
    stmdb sp!, { r2, r3, r4, r5, r6, r7, r8, r9, r12, lr }
    mov r2, 0x0
    mov r3, 0x47 ; Friend count
    mov r12, 0x0
    ldr r4, [local_friend_codes_addr]
    mov r5, #0x0
    str r3, [r1, #0x0] ; Store friend count
    friend_key_loop:
        ldrh r6, [r4, #0x0]
        stmia r0!, { r2, r3, r6, r12 } ; Store friend key (principal id, padding, local friend code)
        add r4, r4, #0x2
        add r5, r5, #0x1
        cmp r5, r3
        bne friend_key_loop
    ldmia sp!, { r2, r3, r4, r5, r6, r7, r8, r9, r12, pc }
    local_friend_codes_addr:
        .dw local_friend_codes
.endarea

; GetFriendScreenName
.org 0x2d2510
.area 0x94
    b fake_get_friend_name ; Move the logic to free up space
    local_friend_codes:
        .dh 0x1324  ; Lillipup, Kecleon, Eevee
        .dh 0x98    ; Dunsparce, Minccino, Ditto
        .dh 0x20ac  ; Teddiursa, Loudred, Smeargle
        .dh 0x5c2   ; Aipom, Audino, Chansey
        .dh 0x17fa  ; Meditite, Pancham, Hariyama
        .dh 0x12a   ; Mankey, Pancham, Tyrogue
        .dh 0x3394  ; Machoke, Throh, Riolu
        .dh 0xea    ; Mienfoo, Sawk, Breloom
        .dh 0x1664  ; Pidgey, Hoothoot, Rufflet
        .dh 0x333e  ; Spearow, Tranquill, Tropius
        .dh 0x1210  ; Farfetch’d, Swanna, Fletchinder
        .dh 0x11ac  ; Doduo, Woobat, Hawlucha
        .dh 0x162c  ; Kakuna, Venomoth, Toxicroak
        .dh 0x234   ; Cascoon, Swalot, Drapion
        .dh 0x63a   ; Seviper, Garbodor, Muk
        .dh 0x2bc   ; Gloom, Ariados, Whirlipede
        .dh 0x17a   ; Phanpy, Marowak, Palpitoad
        .dh 0x21ba  ; Wooper, Camerupt, Gastrodon
        .dh 0x172   ; Trapinch, Dugtrio, Diggersby
        .dh 0x58e   ; Sandshrew, Nincada, Diggersby
        .dh 0x3a4   ; Dwebble, Pupitar, Rhydon
        .dh 0x248   ; Dwebble, Corsola, Shuckle
        .dh 0x570   ; Nosepass, Onix, Barbaracle
        .dh 0x2b6   ; Boldore, Magcargo, Barbaracle
        .dh 0x3c0   ; Butterfree, Beautifly, Vivillon
        .dh 0x396   ; Combee, Masquerain, Venomoth
        .dh 0x16e4  ; Ledyba, Volbeat, Pinsir
        .dh 0x348   ; Paras, Illumise, Heracross
        .dh 0x2f0   ; Shuppet, Phantump, Golurk
        .dh 0x6c2   ; Shuppet, Phantump, Drifblim
        .dh 0x44    ; Lampent, Pumpkaboo, Dusclops
        .dh 0x2a8   ; Lampent, Pumpkaboo, Spiritomb
        .dh 0x128   ; Ferroseed, Metang, Bronzong
        .dh 0x1328  ; Ferroseed, Klang, Excadrill
        .dh 0x15b0  ; Mawile, Skarmory, Klefki
        .dh 0xd8    ; Magneton, Forretress, Klefki
        .dh 0x4d2   ; Ponyta, Charmeleon, Braixen
        .dh 0x262   ; Growlithe, Pyroar, Braixen
        .dh 0x6d4   ; Pansear, Slugma, Fletchinder
        .dh 0x147e  ; Magmar, Larvesta, Ninetales
        .dh 0x4a6   ; Krabby, Wartortle, Frogadier
        .dh 0x506   ; Bibarel, Quagsire, Frogadier
        .dh 0x52a   ; Panpour, Gyarados, Azumarill
        .dh 0x170a  ; Octillery, Floatzel, Poliwhirl
        .dh 0xa6    ; Oddish, Ivysaur, Quilladin
        .dh 0x194   ; Tangela, Petilil, Quilladin
        .dh 0x532   ; Pansage, Sawsbuck, Maractus
        .dh 0x16dc  ; Sunkern, Swadloon, Gogoat
        .dh 0x37a   ; Electrode, Pikachu, Luxio
        .dh 0x20aa  ; Emolga, Helioptile, Galvantula
        .dh 0x14c6  ; Dedenne, Electabuzz, Zebstrika
        .dh 0x350a  ; Pachirisu, Stunfisk, Manectric
        .dh 0x2e4   ; Abra, Wobbuffet, Duosion
        .dh 0x228   ; Drowzee, Sigilyph, Xatu
        .dh 0x562   ; Grumpig, Espurr, Girafarig
        .dh 0x702   ; Munna, Espurr, Gothorita
        .dh 0x1088  ; Snorunt, Bergmite, Lapras
        .dh 0x106   ; Delibird, Bergmite, Cloyster
        .dh 0x134c  ; Spheal, Sneasel, Dewgong
        .dh 0x2b8   ; Snover, Beartic, Piloswine
        .dh 0x11e   ; Gabite, Shelgon, Druddigon
        .dh 0x52c   ; Gabite, Dragonair, Druddigon
        .dh 0x32e   ; Fraxure, Noibat, Sliggoo
        .dh 0x16c8  ; Pawniard, Sneasel, Liepard
        .dh 0x176e  ; Vullaby, Sandile, Inkay
        .dh 0x21d2  ; Nuzleaf, Cacturne, Absol
        .dh 0x5350  ; Mightyena, Crawdaunt, Sableye
        .dh 0x2b0   ; Kirlia, Mawile, Floette
        .dh 0x26ee  ; Snubbull, Jigglypuff, Clefairy
        .dh 0x1274  ; Togepi, Spritzee, Floette
        .dh 0x209   ; Dedenne, Swirlix, Floette
.endarea

; CheckIfSafariSlotIsUnlocked
.org 0x4340e8
.area 0x90
    mov r0, #0x1
    mov pc, lr

    fake_get_friend_name:
        stmdb sp!, { r3, r4, r5, lr }
        adr r3, name
        adr r4, name_end
        name_loop:
            ldrh r5, [r3, #0x0]
            strh r5, [r0, #0x0]
            add r0, #0x2
            add r3, #0x2
            cmp r3, r4
            blt name_loop
        mov r0, #0x0
        ldmia sp!, { r3, r4, r5, pc }
        name:
            .dh 0x5a
            .dh 0x61
            .dh 0x6b
            .dh 0x00
        name_end:
.endarea

; GetHasFriendBeenOnline
.org 0x434934
    mov r0, #0x1
    mov pc, lr

.close
