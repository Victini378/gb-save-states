; md5 e24141ed6fc94b149bbf43b4bd9658e8

.INCLUDE "includes/init.s"
.ROMBANKS 128
.BACKGROUND "Atlantis - The Lost Empire (E) (M3) (Eng-Spa-Ita) [C][!].gbc"
.INCLUDE "includes/header.s"


; config
.DEFINE is_cgb 1
.DEFINE current_rom_bank $7fff
.DEFINE uses_mbc5 1


; joypad
.DEFINE joypad $c10a
.DEFINE joypad_2 $c10b

.BANK $0000 SLOT 0
.ORG $00b8
.SECTION "joypad read" SIZE $20 OVERWRITE
    .INCLUDE "includes/call_relocated_read_from_joypad_in_other_bank.s"
    ret
.ENDS


; save/load state
.BANK $0000 SLOT 0
.ORG $3907
.SECTION "save/load state" SIZE $02f0 OVERWRITE
    .DB "--- Save Patch ---"
    .INCLUDE "includes/joypad_read_and_check.s"
    .INCLUDE "includes/save_state_includes.s"
.ENDS


; Generated with patch-builder.py