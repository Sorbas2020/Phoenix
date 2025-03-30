;********************************************************************
;*                                                                  *
;* PHOENIX                                                          *
;*                                                                  *
;* (c) Amstar Electronics Corp. 1980                                *
;*                                                                  *
;* 20250330                                                         *
;* Skipped all unused code and data.                                *
;* All code and data at original offsets.                           *
;* Assebled with 'Micro Z80 assembler - uz80as' (v2.02).            *
;* https://github.com/jorgicor/uz80as                               *
;* Usage:                                                           *
;* uz80as.exe -x Phoenix.asm                                        *
;********************************************************************

; ForegroundScreen.
ForegroundScreen       .EQU $4000       ;32*26 bytes for the foreground screen

; General storage.
M4350                  .EQU $4350
M4351                  .EQU $4351
M4352                  .EQU $4352
M4353                  .EQU $4353
M4354                  .EQU $4354
M4355                  .EQU $4355
M4356                  .EQU $4356
M4357                  .EQU $4357
M4358                  .EQU $4358
M4359                  .EQU $4359
M435A                  .EQU $435A
M435B                  .EQU $435B
M435E                  .EQU $435E
M435F                  .EQU $435F       ;8 bit counter for alien movement
PlayerMoved            .EQU $4360       ;Flag for: 'player moved' ($FF)
BulletTriggered        .EQU $4361       ;Flag for: 'bullet triggered' ($30) and counter
M4362                  .EQU $4362       ;Player shield animation counter
ParticleExplosion      .EQU $4363       ;Flag for: 'particle explosion start' and animation counter
M4364                  .EQU $4364
M4366                  .EQU $4366
M4367                  .EQU $4367       ;Flag for: 'Mothership partially faded in' ($FF)
M4368                  .EQU $4368
M4369                  .EQU $4369       ;Flag for:'bonus explosion' ($FF)
M436A                  .EQU $436A
M436B                  .EQU $436B       ;Flag for: 'mother ship score display' ($FF) and counter
M436D                  .EQU $436D
M436E                  .EQU $436E
M436F                  .EQU $436F
M4370                  .EQU $4370
M4371                  .EQU $4371
M4372                  .EQU $4372
M4373                  .EQU $4373
M4374                  .EQU $4374
M4378                  .EQU $4378       ;Animation counter for the bonus explosion
M4379                  .EQU $4379       ;First two digits of BCD score value for the bonus explosion (last digit is ever 0)
M437A                  .EQU $437A
M437B                  .EQU $437B
M437C                  .EQU $437C
M4380                  .EQU $4380
Score1high             .EQU $4381       ;Player 1 score BCD (high)
Score1mid              .EQU $4382       ;Player 1 score BCD (mid)
Score1low              .EQU $4383       ;Player 1 score BCD (low)
M4384                  .EQU $4384       ;Ever set to 0 (prevents overflow)
Score2high             .EQU $4385       ;Player 2 score BCD (high)
Score2mid              .EQU $4386       ;Player 2 score BCD (mid)
Score2low              .EQU $4387       ;Player 2 score BCD (low)
M4388                  .EQU $4388       ;Ever set to 0 (prevents overflow)
HiScorehigh            .EQU $4389
HiScoremid             .EQU $438A
HiScorelow             .EQU $438B
SoundControlA          .EQU $438C
SoundControlB          .EQU $438D
M438E                  .EQU $438E
CoinCount              .EQU $438F
Player1Lives           .EQU $4390
Player2Lives           .EQU $4391
M4392                  .EQU $4392
Counter93              .EQU $4393
M4394                  .EQU $4394
M4395                  .EQU $4395
M4396                  .EQU $4396
M4397                  .EQU $4397
M4398                  .EQU $4398
M4399                  .EQU $4399
Counter9A              .EQU $439A
M439B                  .EQU $439B
M439C                  .EQU $439C
M439D                  .EQU $439D
M439E                  .EQU $439E
M439F                  .EQU $439F
IN0Current             .EQU $43A0
IN0Previous            .EQU $43A1
GameOrAttract          .EQU $43A2
GameAndDemoOrSplash    .EQU $43A3
GameState              .EQU $43A4
CounterA5              .EQU $43A5
ShieldCount            .EQU $43A6
AnimationCounter       .EQU $43A7
M43A8                  .EQU $43A8
M43A9                  .EQU $43A9
M43AA                  .EQU $43AA
M43AB                  .EQU $43AB
M43AC                  .EQU $43AC
M43AD                  .EQU $43AD
M43AE                  .EQU $43AE
M43AF                  .EQU $43AF
M43B0                  .EQU $43B0
M43B1                  .EQU $43B1
M43B2                  .EQU $43B2
M43B3                  .EQU $43B3
CounterB4              .EQU $43B4
M43B5                  .EQU $43B5
M43B6                  .EQU $43B6
LevelAndRound          .EQU $43B8
CounterB9              .EQU $43B9
AliensLeft             .EQU $43BA
BirdsLeft              .EQU $43BB
M43BC                  .EQU $43BC
M43BD                  .EQU $43BD
BonusLivesAt           .EQU $43BE
M43BF                  .EQU $43BF

; Player and player bullets, data structure (grid).
PlayerState            .EQU $43C0       ;Player ship control state register
PlayerShape            .EQU $43C1       ;LSB for T1400 player ship character block shapes table
PlayerShipX            .EQU $43C2       ;Player ship, coordinate X ($0C=min.left, $64=default, $C0=max.right)
PlayerShipY            .EQU $43C3       ;Player ship, coordinate Y ($D8)
PlayerBulletState      .EQU $43C4       ;Player bullet, control state register
PlayerBulletShape      .EQU $43C5       ;Player bullet, character code ($50 to $57)
PlayerBulletX          .EQU $43C6       ;Player bullet, coordinate X
PlayerBulletY          .EQU $43C7       ;Player bullet, coordinate Y ($D0=min.bottom, $18=max.top)
AbovePlayerBulletState .EQU $43C8       ;One position above player bullet, control state register
AbovePlayerBulletShape .EQU $43C9       ;One position above player bullet, character code ($50 to $57)
AbovePlayerBulletX     .EQU $43CA       ;One position above player bullet, coordinate X
AbovePlayerBulletY     .EQU $43CB       ;One position above player bullet, coordinate Y

; Alien and bird bullets, data structure (grid).
AlienBullet0State      .EQU $43CC       ;Enemy bullet 0, control state register
AlienBullet0Shape      .EQU $43CD       ;Enemy bullet 0, character code ($58 to $5F)
AlienBullet0X          .EQU $43CE       ;Enemy bullet 0, coordinate X
AlienBullet0Y          .EQU $43CF       ;Enemy bullet 0, coordinate Y
AlienBullet1State      .EQU $43D0       ;Enemy bullet 1, control state register
AlienBullet1Shape      .EQU $43D1       ;Enemy bullet 1, character code ($58 to $5F)
AlienBullet1X          .EQU $43D2       ;Enemy bullet 1, coordinate X
AlienBullet1Y          .EQU $43D3       ;Enemy bullet 1, coordinate Y
AlienBullet2State      .EQU $43D4       ;Enemy bullet 2, control state register
AlienBullet2Shape      .EQU $43D5       ;Enemy bullet 2, character code ($58 to $5F)
AlienBullet2X          .EQU $43D6       ;Enemy bullet 2, coordinate X
AlienBullet2Y          .EQU $43D7       ;Enemy bullet 2, coordinate Y
AlienBullet3State      .EQU $43D8       ;Enemy bullet 3, control state register
AlienBullet3Shape      .EQU $43D9       ;Enemy bullet 3, character code ($58 to $5F)
AlienBullet3X          .EQU $43DA       ;Enemy bullet 3, coordinate X
AlienBullet3Y          .EQU $43DB       ;Enemy bullet 3, coordinate Y
AlienBullet4State      .EQU $43DC       ;Enemy bullet 4, control state register
AlienBullet4Shape      .EQU $43DD       ;Enemy bullet 4, character code ($58 to $5F)
AlienBullet4X          .EQU $43DE       ;Enemy bullet 4, coordinate X
AlienBullet4Y          .EQU $43DF       ;Enemy bullet 4, coordinate Y

; Player and player bullets, data structure (screen ram).
OldPlayerShipMSB       .EQU $43E0       ;Old MSB screen ram: Upper left character of player ship
OldPlayerShipLSB       .EQU $43E1       ;Old LSB screen ram: Upper left character of player ship
PlayerShipMSB          .EQU $43E2       ;MSB screen ram: Upper left character of player ship
PlayerShipLSB          .EQU $43E3       ;LSB screen ram: Upper left character of player ship
PlayerBulletMSB        .EQU $43E4       ;MSB screen ram: Player bullet
PlayerBulletLSB        .EQU $43E5       ;LSB screen ram: Player bullet
AbovePlayerBulletMSB   .EQU $43E6       ;MSB screen ram: One character above player bullet
AbovePlayerBulletLSB   .EQU $43E7       ;LSB screen ram: One character above player bullet
M43E8                  .EQU $43E8
M43E9                  .EQU $43E9
M43EA                  .EQU $43EA
M43EB                  .EQU $43EB

; Alien and bird bullets, data structure (screen ram).
OldAlienBullet0MSB     .EQU $43EC       ;Old MSB screen ram: Enemy bullet 0
OldAlienBullet0LSB     .EQU $43ED       ;Old LSB screen ram: Enemy bullet 0
AlienBullet0MSB        .EQU $43EE       ;MSB screen ram: Enemy bullet 0
AlienBullet0LSB        .EQU $43EF       ;LSB screen ram: Enemy bullet 0
OldAlienBullet1MSB     .EQU $43F0       ;Old MSB screen ram: Enemy bullet 1
OldAlienBullet1LSB     .EQU $43F1       ;Old LSB screen ram: Enemy bullet 1
AlienBullet1MSB        .EQU $43F2       ;MSB screen ram: Enemy bullet 1
AlienBullet1LSB        .EQU $43F3       ;LSB screen ram: Enemy bullet 1
OldAlienBullet2MSB     .EQU $43F4       ;Old MSB screen ram: Enemy bullet 2
OldAlienBullet2LSB     .EQU $43F5       ;Old LSB screen ram: Enemy bullet 2
AlienBullet2MSB        .EQU $43F6       ;MSB screen ram: Enemy bullet 2
AlienBullet2LSB        .EQU $43F7       ;LSB screen ram: Enemy bullet 2
OldAlienBullet3MSB     .EQU $43F8       ;Old MSB screen ram: Enemy bullet 3
OldAlienBullet3LSB     .EQU $43F9       ;Old LSB screen ram: Enemy bullet 3
AlienBullet3MSB        .EQU $43FA       ;MSB screen ram: Enemy bullet 3
AlienBullet3LSB        .EQU $43FB       ;LSB screen ram: Enemy bullet 3
OldAlienBullet4MSB     .EQU $43FC       ;Old MSB screen ram: Enemy bullet 4
OldAlienBullet4LSB     .EQU $43FD       ;Old LSB screen ram: Enemy bullet 4
AlienBullet4MSB        .EQU $43FE       ;MSB screen ram: Enemy bullet 4
AlienBullet4LSB        .EQU $43FF       ;LSB screen ram: Enemy bullet 4

; Background screen.
BackgroundScreen       .EQU $4800       ;32*26 bytes for the background screen

; Pointer to alien movement pattern.
M4B50                  .EQU $4B50       ;Alien0 movement pattern table MSB
M4B51                  .EQU $4B51       ;Alien0 movement pattern table LSB
M4B52                  .EQU $4B52       ;Alien1 movement pattern table MSB
M4B53                  .EQU $4B53       ;Alien1 movement pattern table LSB
M4B54                  .EQU $4B54       ;Alien2 movement pattern table MSB
M4B55                  .EQU $4B55       ;Alien2 movement pattern table LSB
M4B56                  .EQU $4B56       ;Alien3 movement pattern table MSB
M4B57                  .EQU $4B57       ;Alien3 movement pattern table LSB
M4B58                  .EQU $4B58       ;Alien4 movement pattern table MSB
M4B59                  .EQU $4B59       ;Alien4 movement pattern table LSB
M4B5A                  .EQU $4B5A       ;Alien5 movement pattern table MSB
M4B5B                  .EQU $4B5B       ;Alien5 movement pattern table LSB
M4B5C                  .EQU $4B5C       ;Alien6 movement pattern table MSB
M4B5D                  .EQU $4B5D       ;Alien6 movement pattern table LSB
M4B5E                  .EQU $4B5E       ;Alien7 movement pattern table MSB
M4B5F                  .EQU $4B5F       ;Alien7 movement pattern table LSB
M4B60                  .EQU $4B60       ;Alien8 movement pattern table MSB
M4B61                  .EQU $4B61       ;Alien8 movement pattern table LSB
M4B62                  .EQU $4B62       ;Alien9 movement pattern table MSB
M4B63                  .EQU $4B63       ;Alien9 movement pattern table LSB
M4B64                  .EQU $4B64       ;AlienA movement pattern table MSB
M4B65                  .EQU $4B65       ;AlienA movement pattern table LSB
M4B66                  .EQU $4B66       ;AlienB movement pattern table MSB
M4B67                  .EQU $4B67       ;AlienB movement pattern table LSB
M4B68                  .EQU $4B68       ;AlienC movement pattern table MSB
M4B69                  .EQU $4B69       ;AlienC movement pattern table LSB
M4B6A                  .EQU $4B6A       ;AlienD movement pattern table MSB
M4B6B                  .EQU $4B6B       ;AlienD movement pattern table LSB
M4B6C                  .EQU $4B6C       ;AlienE movement pattern table MSB
M4B6D                  .EQU $4B6D       ;AlienE movement pattern table LSB
M4B6E                  .EQU $4B6E       ;AlienF movement pattern table MSB
M4B6F                  .EQU $4B6F       ;AlienF movement pattern table LSB

; Alien data structure (grid).
; Used for all levels with the 16 aliens.
; Level: 1, 2, 5 (with mothership), 6, 7, 10(with mothership).
; During 'fade in' phase, the alien control state B is holding the character code!
M4B70                  .EQU $4B70       ;Alien0 control state A
M4B71                  .EQU $4B71       ;Alien0 control state B (LSB for T14xx)
M4B72                  .EQU $4B72       ;Alien0 screen coordinate X
M4B73                  .EQU $4B73       ;Alien0 screen coordinate Y
M4B74                  .EQU $4B74       ;Alien1 control state A
M4B75                  .EQU $4B75       ;Alien1 control state B (LSB for T14xx)
M4B76                  .EQU $4B76       ;Alien1 screen coordinate X
M4B77                  .EQU $4B77       ;Alien1 screen coordinate Y
M4B78                  .EQU $4B78       ;Alien2 control state A
M4B79                  .EQU $4B79       ;Alien2 control state B (LSB for T14xx)
M4B7A                  .EQU $4B7A       ;Alien2 screen coordinate X
M4B7B                  .EQU $4B7B       ;Alien2 screen coordinate Y
M4B7C                  .EQU $4B7C       ;Alien3 control state A
M4B7D                  .EQU $4B7D       ;Alien3 control state B (LSB for T14xx)
M4B7E                  .EQU $4B7E       ;Alien3 screen coordinate X
M4B7F                  .EQU $4B7F       ;Alien3 screen coordinate Y
M4B80                  .EQU $4B80       ;Alien4 control state A
M4B81                  .EQU $4B81       ;Alien4 control state B (LSB for T14xx)
M4B82                  .EQU $4B82       ;Alien4 screen coordinate X
M4B83                  .EQU $4B83       ;Alien4 screen coordinate Y
M4B84                  .EQU $4B84       ;Alien5 control state A
M4B85                  .EQU $4B85       ;Alien5 control state B (LSB for T14xx)
M4B86                  .EQU $4B86       ;Alien5 screen coordinate X
M4B87                  .EQU $4B87       ;Alien5 screen coordinate Y
M4B88                  .EQU $4B88       ;Alien6 control state A
M4B89                  .EQU $4B89       ;Alien6 control state B (LSB for T14xx)
M4B8A                  .EQU $4B8A       ;Alien6 screen coordinate X
M4B8B                  .EQU $4B8B       ;Alien6 screen coordinate Y
M4B8C                  .EQU $4B8C       ;Alien7 control state A
M4B8D                  .EQU $4B8D       ;Alien7 control state B (LSB for T14xx)
M4B8E                  .EQU $4B8E       ;Alien7 screen coordinate X
M4B8F                  .EQU $4B8F       ;Alien7 screen coordinate Y
M4B90                  .EQU $4B90       ;Alien8 control state A
M4B91                  .EQU $4B91       ;Alien8 control state B (LSB for T14xx)
M4B92                  .EQU $4B92       ;Alien8 screen coordinate X
M4B93                  .EQU $4B93       ;Alien8 screen coordinate Y
M4B94                  .EQU $4B94       ;Alien9 control state A
M4B95                  .EQU $4B95       ;Alien9 control state B (LSB for T14xx)
M4B96                  .EQU $4B96       ;Alien9 screen coordinate X
M4B97                  .EQU $4B97       ;Alien9 screen coordinate Y
M4B98                  .EQU $4B98       ;AlienA control state A
M4B99                  .EQU $4B99       ;AlienA control state B (LSB for T14xx)
M4B9A                  .EQU $4B9A       ;AlienA screen coordinate X
M4B9B                  .EQU $4B9B       ;AlienA screen coordinate Y
M4B9C                  .EQU $4B9C       ;AlienB control state A
M4B9D                  .EQU $4B9D       ;AlienB control state B (LSB for T14xx)
M4B9E                  .EQU $4B9E       ;AlienB screen coordinate X
M4B9F                  .EQU $4B9F       ;AlienB screen coordinate Y
M4BA0                  .EQU $4BA0       ;AlienC control state A
M4BA1                  .EQU $4BA1       ;AlienC control state B (LSB for T14xx)
M4BA2                  .EQU $4BA2       ;AlienC screen coordinate X
M4BA3                  .EQU $4BA3       ;AlienC screen coordinate Y
M4BA4                  .EQU $4BA4       ;AlienD control state A
M4BA5                  .EQU $4BA5       ;AlienD control state B (LSB for T14xx)
M4BA6                  .EQU $4BA6       ;AlienD screen coordinate X
M4BA7                  .EQU $4BA7       ;AlienD screen coordinate Y
M4BA8                  .EQU $4BA8       ;AlienE control state A
M4BA9                  .EQU $4BA9       ;AlienE control state B (LSB for T14xx)
M4BAA                  .EQU $4BAA       ;AlienE screen coordinate X
M4BAB                  .EQU $4BAB       ;AlienE screen coordinate Y
M4BAC                  .EQU $4BAC       ;AlienF control state A
M4BAD                  .EQU $4BAD       ;AlienF control state B (LSB for T14xx)
M4BAE                  .EQU $4BAE       ;AlienF screen coordinate X
M4BAF                  .EQU $4BAF       ;AlienF screen coordinate Y

; Bird data structure.
; Used for all levels with the 8 birds.
; Level: 3, 4, 8, 9.
; For the bird animation during intro splash, bird0 memory is used.
B4B70                  .EQU $4B70       ;Bird0 index character block shape
B4B71                  .EQU $4B71       ;Bird0 MSB initial screen address  
B4B72                  .EQU $4B72       ;Bird0 LSB initial screen address  
B4B73                  .EQU $4B73       ;Bird0 ?                           
B4B74                  .EQU $4B74       ;Bird0 ?                           
B4B75                  .EQU $4B75       ;Bird0 grid coordinate X ?         
B4B76                  .EQU $4B76       ;Bird0 ?                           
B4B77                  .EQU $4B77       ;Bird0 grid coordinate Y ?         
B4B78                  .EQU $4B78       ;Bird1 index character block shape 
B4B79                  .EQU $4B79       ;Bird1 MSB initial screen address  
B4B7A                  .EQU $4B7A       ;Bird1 LSB initial screen address  
B4B7B                  .EQU $4B7B       ;Bird1 ?                           
B4B7C                  .EQU $4B7C       ;Bird1 ?                           
B4B7D                  .EQU $4B7D       ;Bird1 grid coordinate X ?         
B4B7E                  .EQU $4B7E       ;Bird1 ?                           
B4B7F                  .EQU $4B7F       ;Bird1 grid coordinate Y ?         
B4B80                  .EQU $4B80       ;Bird2 index character block shape 
B4B81                  .EQU $4B81       ;Bird2 MSB initial screen address  
B4B82                  .EQU $4B82       ;Bird2 LSB initial screen address  
B4B83                  .EQU $4B83       ;Bird2 ?                           
B4B84                  .EQU $4B84       ;Bird2 ?                           
B4B85                  .EQU $4B85       ;Bird2 grid coordinate X ?         
B4B86                  .EQU $4B86       ;Bird2 ?                           
B4B87                  .EQU $4B87       ;Bird2 grid coordinate Y ?         
B4B88                  .EQU $4B88       ;Bird3 index character block shape 
B4B89                  .EQU $4B89       ;Bird3 MSB initial screen address  
B4B8A                  .EQU $4B8A       ;Bird3 LSB initial screen address  
B4B8B                  .EQU $4B8B       ;Bird3 ?                           
B4B8C                  .EQU $4B8C       ;Bird3 ?                           
B4B8D                  .EQU $4B8D       ;Bird3 grid coordinate X ?         
B4B8E                  .EQU $4B8E       ;Bird3 ?                           
B4B8F                  .EQU $4B8F       ;Bird3 grid coordinate Y ?         
B4B90                  .EQU $4B90       ;Bird4 index character block shape 
B4B91                  .EQU $4B91       ;Bird4 MSB initial screen address  
B4B92                  .EQU $4B92       ;Bird4 LSB initial screen address  
B4B93                  .EQU $4B93       ;Bird4 ?                           
B4B94                  .EQU $4B94       ;Bird4 ?                           
B4B95                  .EQU $4B95       ;Bird4 grid coordinate X ?         
B4B96                  .EQU $4B96       ;Bird4 ?                           
B4B97                  .EQU $4B97       ;Bird4 grid coordinate Y ?         
B4B98                  .EQU $4B98       ;Bird5 index character block shape 
B4B99                  .EQU $4B99       ;Bird5 MSB initial screen address  
B4B9A                  .EQU $4B9A       ;Bird5 LSB initial screen address  
B4B9B                  .EQU $4B9B       ;Bird5 ?                           
B4B9C                  .EQU $4B9C       ;Bird5 ?                           
B4B9D                  .EQU $4B9D       ;Bird5 grid coordinate X ?         
B4B9E                  .EQU $4B9E       ;Bird5 ?                           
B4B9F                  .EQU $4B9F       ;Bird5 grid coordinate Y ?         
B4BA0                  .EQU $4BA0       ;Bird6 index character block shape 
B4BA1                  .EQU $4BA1       ;Bird6 MSB initial screen address  
B4BA2                  .EQU $4BA2       ;Bird6 LSB initial screen address  
B4BA3                  .EQU $4BA3       ;Bird6 ?                           
B4BA4                  .EQU $4BA4       ;Bird6 ?                           
B4BA5                  .EQU $4BA5       ;Bird6 grid coordinate X ?         
B4BA6                  .EQU $4BA6       ;Bird6 ?                           
B4BA7                  .EQU $4BA7       ;Bird6 grid coordinate Y ?         
B4BA8                  .EQU $4BA8       ;Bird7 index character block shape 
B4BA9                  .EQU $4BA9       ;Bird7 MSB initial screen address  
B4BAA                  .EQU $4BAA       ;Bird7 LSB initial screen address  
B4BAB                  .EQU $4BAB       ;Bird7 ?                           
B4BAC                  .EQU $4BAC       ;Bird7 ?                           
B4BAD                  .EQU $4BAD       ;Bird7 grid coordinate X ?         
B4BAE                  .EQU $4BAE       ;Bird7 ?                           
B4BAF                  .EQU $4BAF       ;Bird7 grid coordinate Y ?         

; Alien data structure (screen ram)
M4BB0                  .EQU $4BB0       ;Old MSB screen ram adress alien0
M4BB1                  .EQU $4BB1       ;Old LSB screen ram adress alien0
M4BB2                  .EQU $4BB2       ;MSB screen ram adress alien0
M4BB3                  .EQU $4BB3       ;LSB screen ram adress alien0
M4BB4                  .EQU $4BB4       ;Old MSB screen ram adress alien1
M4BB5                  .EQU $4BB5       ;Old LSB screen ram adress alien1
M4BB6                  .EQU $4BB6       ;MSB screen ram adress alien1
M4BB7                  .EQU $4BB7       ;LSB screen ram adress alien1
M4BB8                  .EQU $4BB8       ;Old MSB screen ram adress alien2
M4BB9                  .EQU $4BB9       ;Old LSB screen ram adress alien2
M4BBA                  .EQU $4BBA       ;MSB screen ram adress alien2
M4BBB                  .EQU $4BBB       ;LSB screen ram adress alien2
M4BBC                  .EQU $4BBC       ;Old MSB screen ram adress alien3
M4BBD                  .EQU $4BBD       ;Old LSB screen ram adress alien3
M4BBE                  .EQU $4BBE       ;MSB screen ram adress alien3
M4BBF                  .EQU $4BBF       ;LSB screen ram adress alien3
M4BC0                  .EQU $4BC0       ;Old MSB screen ram adress alien4
M4BC1                  .EQU $4BC1       ;Old LSB screen ram adress alien4
M4BC2                  .EQU $4BC2       ;MSB screen ram adress alien4
M4BC3                  .EQU $4BC3       ;LSB screen ram adress alien4
M4BC4                  .EQU $4BC4       ;Old MSB screen ram adress alien5
M4BC5                  .EQU $4BC5       ;Old LSB screen ram adress alien5
M4BC6                  .EQU $4BC6       ;MSB screen ram adress alien5
M4BC7                  .EQU $4BC7       ;LSB screen ram adress alien5
M4BC8                  .EQU $4BC8       ;Old MSB screen ram adress alien6
M4BC9                  .EQU $4BC9       ;Old LSB screen ram adress alien6
M4BCA                  .EQU $4BCA       ;MSB screen ram adress alien6
M4BCB                  .EQU $4BCB       ;LSB screen ram adress alien6
M4BCC                  .EQU $4BCC       ;Old MSB screen ram adress alien7
M4BCD                  .EQU $4BCD       ;Old LSB screen ram adress alien7
M4BCE                  .EQU $4BCE       ;MSB screen ram adress alien7
M4BCF                  .EQU $4BCF       ;LSB screen ram adress alien7
M4BD0                  .EQU $4BD0       ;Old MSB screen ram adress alien8
M4BD1                  .EQU $4BD1       ;Old LSB screen ram adress alien8
M4BD2                  .EQU $4BD2       ;MSB screen ram adress alien8
M4BD3                  .EQU $4BD3       ;LSB screen ram adress alien8
M4BD4                  .EQU $4BD4       ;Old MSB screen ram adress alien9
M4BD5                  .EQU $4BD5       ;Old LSB screen ram adress alien9
M4BD6                  .EQU $4BD6       ;MSB screen ram adress alien9
M4BD7                  .EQU $4BD7       ;LSB screen ram adress alien9
M4BD8                  .EQU $4BD8       ;Old MSB screen ram adress alienA
M4BD9                  .EQU $4BD9       ;Old LSB screen ram adress alienA
M4BDA                  .EQU $4BDA       ;MSB screen ram adress alienA
M4BDB                  .EQU $4BDB       ;LSB screen ram adress alienA
M4BDC                  .EQU $4BDC       ;Old MSB screen ram adress alienB
M4BDD                  .EQU $4BDD       ;Old LSB screen ram adress alienB
M4BDE                  .EQU $4BDE       ;MSB screen ram adress alienB
M4BDF                  .EQU $4BDF       ;LSB screen ram adress alienB
M4BE0                  .EQU $4BE0       ;Old MSB screen ram adress alienC
M4BE1                  .EQU $4BE1       ;Old LSB screen ram adress alienC
M4BE2                  .EQU $4BE2       ;MSB screen ram adress alienC
M4BE3                  .EQU $4BE3       ;LSB screen ram adress alienC
M4BE4                  .EQU $4BE4       ;Old MSB screen ram adress alienD
M4BE5                  .EQU $4BE5       ;Old LSB screen ram adress alienD
M4BE6                  .EQU $4BE6       ;MSB screen ram adress alienD
M4BE7                  .EQU $4BE7       ;LSB screen ram adress alienD
M4BE8                  .EQU $4BE8       ;Old MSB screen ram adress alienE
M4BE9                  .EQU $4BE9       ;Old LSB screen ram adress alienE
M4BEA                  .EQU $4BEA       ;MSB screen ram adress alienE
M4BEB                  .EQU $4BEB       ;LSB screen ram adress alienE
M4BEC                  .EQU $4BEC       ;Old MSB screen ram adress alienF
M4BED                  .EQU $4BED       ;Old LSB screen ram adress alienF
M4BEE                  .EQU $4BEE       ;MSB screen ram adress alienF
M4BEF                  .EQU $4BEF       ;LSB screen ram adress alienF

; Bird extended storage
; Used for all levels with the 8 birds.
B4BC0                  .EQU $4BC0
B4BC1                  .EQU $4BC1
B4BC2                  .EQU $4BC2
B4BC3                  .EQU $4BC3
B4BC4                  .EQU $4BC4
B4BC5                  .EQU $4BC5
B4BD1                  .EQU $4BD1
B4BD2                  .EQU $4BD2
B4BD3                  .EQU $4BD3
B4BD4                  .EQU $4BD4
B4BD5                  .EQU $4BD5
B4BD6                  .EQU $4BD6
B4BD7                  .EQU $4BD7
B4BED                  .EQU $4BED
B4BEE                  .EQU $4BEE
B4BEF                  .EQU $4BEF

; Stack
Stack                  .EQU $4BF0

;HW
videoRegister          .EQU $5000       ;Lower bit selects the RAM bank
scrollRegister         .EQU $5800       ;Screen scrolling
SOUNDCTLA              .EQU $6000       ;Sound control A
SOUNDCTLB              .EQU $6800       ;Sound control B
IN0                    .EQU $7000       ;Player inputs
DSW0                   .EQU $7800       ;DIP switch settings

                       .ORG $0000
L0000:
                       NOP                         ; Start/restart and interrupts end up at 0008
                       NOP                         ;
                       NOP                         ;
                       NOP                         ;
                       NOP                         ;
                       NOP                         ;
                       NOP                         ;
                       NOP                         ;
; 
                       LD      SP,$4BFF            ; Top-ish of RAM
                       LD      H,videoRegister >> 8
                       LD      (HL),$00            ; Select the first bank of RAM
                       CALL    InitSoundScreen     ; Turn sound off and clear both screen areas
                       LD      HL,T1800            ; Screen draw info
                       LD      C,$03               ; 3 columns (rotated to 3 rows)
                       CALL    PrintTextLines      ; Draw the first 3 rows of the background (scores and coins)
; Main loop begin
MainLoop:
                       CALL    WaitVBlankCoin      ; Wait for VBlank and count any coins
                       LD      A,(GameOrAttract)   ;
                       AND     A                   ; updates the zero flag
                       JP      Z,L002D             ; if 'Attract mode'
; Game mode
                       CALL    GameStateMachine    ; controls the flow of the game.
                       CALL    UpdateScoresAndSound
                       JP      MainLoop            ; Back to top of main loop
; Attract mode (no sound, no scoreing, no manual steering)
L002D:
                       LD      A,$0F               ; 0000_1111 mute the sound chip TMS36XX
                       LD      H,SOUNDCTLA >> 8    ; 60xx sound A
                       LD      (HL),A              ;
                       LD      H,SOUNDCTLB >> 8    ; 68xx sound B
                       LD      (HL),A              ;
                       CALL    UpdateSoundControlRAM
                       NOP                         ;
                       CALL    CoinChecking        ;
                       AND     A                   ; updates the zero flag
                       JP      Z,L0046             ; No credits ... continue splash
                       CALL    PromptForStartGame  ;
                       JP      MainLoop            ; Back to top of main loop
; 
L0046:
                       CALL    SplashAndDemo       ;
                       JP      MainLoop            ; Back to top of main loop
; Main loop end.

                       .ORG $0050
;*****************************************************************************
;* Initialize the sound (off) and screen (clear)
;*****************************************************************************
InitSoundScreen:
                       LD      H,SOUNDCTLB >> 8    ; 68xx sound B
                       LD      (HL),$00            ; Sound off
                       LD      H,SOUNDCTLA >> 8    ; 60xx sound A
                       LD      (HL),$00            ; Sound off
                       LD      H,scrollRegister >> 8
                       LD      (HL),$00            ; First memory bank
                       CALL    ClearRAMBank        ; Clear the bank (includes screen)
                       LD      H,videoRegister >> 8
                       LD      (HL),$01            ; Second memory bank
                       CALL    ClearRAMBank        ; Clear the bank (includes screen)
                       LD      H,videoRegister >> 8
                       LD      (HL),$00            ; Back to first memory bank
                       RET                         ; Done

;*****************************************************************************
;* Clear a RAM Bank (bank 0 or 1)
;* Set the lower bit of the video register to pick the bank before calling.
;* 4000 - 4BF8
;* We call this function, which means we don't want to clear the return on the stack.
;* That's why we start clearing at 4BF8 instead of 4BFF.
;* Since screen memory is part of this bank, we are clearing the screen too.
;*****************************************************************************
ClearRAMBank:
                       LD      HL,$4BF8            ; Highest point ... skip the top of the stack
                       LD      A,$3F               ; Stop when H reaches 3F
L0070:
                       LD      (HL),$00            ; Clear the memory
                       DEC     HL                  ; Point to next
                       CP      H                   ; All done?
                       JP      NZ,L0070            ; No ... go back for all
                       RET                         ; Done

;*****************************************************************************
;* Slow printing the static texts and filling the scroll register
;* with background tiles.
;* Only used at attract mode during the intro splash.
;*****************************************************************************
SlowPrintScrollRegisterUpdate:
                       CALL    SlowPrintScoreAverageTable
                       JP      L06F0               ; update scroll register and fill background

                       .ORG $0080
;*****************************************************************************
;* Wait for the vertical blanking and then handle coin counting
;*****************************************************************************
WaitVBlankCoin:
                       LD      H,DSW0 >> 8         ; 78xx DSW0 Check ...
                       LD      A,(HL)              ; ... screen blanking flag
                       AND     $80                 ; Wait for it ...
                       JP      Z,WaitVBlankCoin    ; ... to set
; 
L0088:
                       LD      A,(HL)              ; Check screen blanking flag
                       AND     $80                 ; Wait for it ...
                       JP      NZ,L0088            ; ... to clear (0=in blanking)
                       LD      H,IN0 >> 8          ; 70xx IN0 Current value ...
                       LD      A,(HL)              ; ... of IN0 inputs
                       LD      HL,IN0Current       ; Value from ...
                       LD      B,(HL)              ; ... last read
                       LD      (HL),A              ; Store new value
                       INC     L                   ; To 43A1
                       LD      (HL),B              ; Store old value
                       LD      L,$9B               ; Bump the ...
                       CALL    AddOneToMem         ; ... ?? counter
                       LD      L,$8F               ; Get number ...
                       LD      A,(HL)              ; ... of coins
;
; !! There are two digits for "coins" on the screen, but only the one's digit is
; !! changed. Once you get to 9, the code stops counting. It takes the coin
; !! from you, but it doesn't give you credit.
;
                       CP      $09                 ; Already 9?
                       RET     Z                   ; Yes ... nothing more to check
                       JP      NC,L0000            ; More than 9? OOPS -- soft reset
                       LD      B,$01               ; Coin bit of the input register
                       CALL    CheckInputBits      ; Has the coin input gone from 1 to 0?
                       RET     Z                   ; No ... no coins inserted ... done
                       LD      L,$8F               ; Add one ...
                       INC     (HL)                ; ... to coin count
                       LD      A,(HL)              ; Current value ...
                       ADD     $20                 ; ... to number tile
                       LD      ($4142),A           ; Change number of coins on screen
                       RET                         ; Done

                       .ORG $00BB
;*****************************************************************************
;* Check to see if a particular bit(s) in the input register has changed
;* from 1 to 0 since last we checked. Return NZ if transitioned from 1 to 0.
;*****************************************************************************
CheckInputBits:
                       LD      HL,IN0Current       ; Get current ...
                       LD      A,(HL)              ; ... input value
                       CPL                         ; Flip the current bits
                       AND     B                   ; Mask off all but the ones we are checking
                       INC     L                   ; Point to last input value
                       AND     (HL)                ; Zero unles new bit is 0 and old is 1
                       RET                         ; Return state

;*****************************************************************************
;* Prints the number pointed to by HL (points to the end of the number) to the screen pointed
;* to by DE (points to the end of the screen area). B is the number of digits to print.
;*****************************************************************************
PrintNumber:
                       LD      A,(HL)              ; Get the two digits
                       AND     $0F                 ; Keep the LSB
                       OR      $20                 ; Offset to number tile
                       LD      (DE),A              ; Store the number tile to screen memory
                       CALL    LeftOneColumn       ; next screen position
                       DEC     B                   ; All done?
                       RET     Z                   ; Yes ... out
                       LD      A,(HL)              ; Keep the ...
                       RRCA                        ; ...
                       RRCA                        ; ...
                       RRCA                        ; ...
                       RRCA                        ; ...
                       AND     $0F                 ; ... LSB
                       OR      $20                 ; Offset to number tile
                       LD      (DE),A              ; Store the number tile to screen memory
                       CALL    LeftOneColumn       ; next screen position
                       DEC     HL                  ; Next data position
                       DEC     B                   ; All digits done?
                       JP      NZ,PrintNumber      ; No ... keep going
                       RET                         ; Yes ... out

                       .ORG $00E3
;*****************************************************************************
;* Handles the intro splash and the game demo.
;*****************************************************************************
SplashAndDemo:
                       LD      HL,M4399            ; starts with 0
                       CALL    AddOneToMem         ; increases it by one
                       LD      BC,$0001            ;
                       CALL    CompareBCtoMem      ;
                       JP      Z,PrintCopyright    ; do if $4398:$4399 is >= 00 01
                       LD      BC,$0002            ;
                       LD      DE,$011F            ; used as delay counter
                       CALL    SubtractIfEnough    ;
                       JP      NC,SlowPrintScoreAverageTable
                       LD      BC,$0120            ; for a longer break
                       CALL    CompareBCtoMem      ;
                       JP      Z,DrawScoreAverageTableTiles
                       LD      C,$B0               ; for a short break
                       CALL    CompareBCtoMem      ;
                       JP      Z,PrintCopyright    ; do if $4398:$4399 is >= 01 B0
                       LD      C,$B8               ;
                       CALL    CompareBCtoMem      ;
                       JP      Z,InitGlobalLevelData
                       LD      C,$C0               ; for a short break
                       LD      DE,$02DF            ;
                       CALL    SubtractIfEnough    ;
                       JP      NC,SlowPrintScrollRegisterUpdate
                       LD      BC,$0300            ;
                       LD      DE,$03AF            ;
                       CALL    SubtractIfEnough    ;
                       JP      NC,DrawIntroBirdAnimationFrame
                       LD      BC,$03E6            ;
                       LD      DE,$FFFF            ;
                       CALL    SubtractIfEnough    ;
                       JP      NC,GameDemo         ; do if $4398:$4399 is >= 03 E6
                       RET                         ;

                       .ORG $0140
;*****************************************************************************
;* Clears foreground and background but leaves the 3 score rows.
;*****************************************************************************
ClearForeAndBackground:
                       CALL    ClearBackground     ; Clear the background
                       CALL    WaitVBlankCoin      ; Wait for VBlank
                       CALL    ClearForeground     ; Clear the foreground (leave the 3 score rows)
                       LD      HL,GameAndDemoOrSplash
                       LD      (HL),$02            ; set to: 'Intro splash'
                       INC     L                   ; GameState
                       LD      (HL),$00            ; to 0
                       NOP                         ; Old command removed or space for a future replace patch
                       NOP                         ; ..
                       NOP                         ; ..
                       LD      L,$B8               ; LevelAndRound, $43B9, AliensLeft, BirdsLeft, $43BC, $43BD, BonusLivesAt, $43BF to 0
                       LD      B,$08               ; number of bytes to clear
                       CALL    ClearBbytesAtHL     ;
                       LD      L,$BA               ; Set AliensLeft
                       LD      (HL),$10            ; to 16 aliens left in wave
                       LD      L,$BE               ;
                       LD      A,(DSW0)            ; 78xx DSW0, get DIP switch settings
                       AND     $0C                 ; mask out 0000_1100 the Bonus lives
                       RLCA                        ; rotate left ..
                       RLCA                        ; .. to 0011_0000
                       ADD     $30                 ; $30, $40, $50, or $60
                       LD      (HL),A              ; save to BonusLivesAt
                       LD      H,scrollRegister >> 8
                       LD      (HL),$00            ; init screen scrolling
                       CALL    WaitVBlankCoin      ;
                       RET                         ;

;*****************************************************************************
;* Used for the game demo during attract mode.
;* Returning the bits for feeding the IN0Current for the simulated player inputs.
;* Resulting values are depending on $4398:$4399 .
;* Counter value goes from $03E6 to $1510 during the demo.
;* 1010_1110...move left
;* 1100_1110...move right
;* 1111_1110...push fire
;* 0111_1110...push shield
;*****************************************************************************
GetPlayerInputsForDemo:
                       LD      A,(HL)              ; get $4399 (LSB from 16 bit counter)
                       AND     $7F                 ; mask out 0111_1111, (counter goes from 00 to $7F)
                       LD      B,$CE               ; return : 1100_1110...move right
                       CP      $1F                 ; 1st trigger point of demo
                       RET     C                   ; return if greater
                       LD      B,$FE               ; 1111_1110...push fire
                       RET     Z                   ; return if equal
                       LD      B,$AE               ; 1010_1110...move left
                       CP      $5F                 ; 2nd trigger point of demo
                       RET     C                   ; return if greater
                       LD      B,$FE               ; 1111_1110...push fire
                       RET     Z                   ; return if equal
                       LD      B,$CE               ; 1100_1110...move right
                       CP      $7F                 ; 3rd trigger point of demo
                       RET     C                   ; return if greater
                       LD      B,$FE               ; 1111_1110...push fire
                       DEC     L                   ;
                       LD      A,(HL)              ; get $4398 (MSB from 16 bit counter)
                       CP      $09                 ; 4rd trigger point of demo
                       RET     NZ                  ; return if not equal
                       LD      B,$7E               ; 0111_1110...push shield
                       RET                         ;

                       .ORG $0196
;*****************************************************************************
;* Slow printing the static texts for the score average table 
;* and the big letters of phoenix title.
;*****************************************************************************
SlowPrintScoreAverageTable:
                       LD      A,(HL)              ; get actual index for slow print ($4399)
                       AND     $1F                 ; mask out 0001_1111
                       CP      $06                 ; reached state 6 ?
                       RET     C                   ; no..return
                       LD      E,A                 ; save the state
                       LD      A,(HL)              ; get actual index for slow print ($4399)
                       AND     $E0                 ; mask out 1110_0000
                       LD      C,A                 ; save bits 5,6,7
                       DEC     L                   ;
                       LD      B,(HL)              ; get zero reference from $4398
                       LD      L,$A8               ; ..and..
                       LD      (HL),B              ; save it to $43A8
                       INC     L                   ;
                       LD      (HL),C              ; save bits 5,6,7 to $43A9
                       LD      BC,T1860            ; data block starting with 'INSERT  COIN' text
                       CALL    AddBCtoMem          ; stores MSB LSB
                       LD      A,(HL)              ;
                       DEC     L                   ;
                       LD      H,(HL)              ;
                       LD      L,A                 ;
                       LD      A,E                 ;
                       LD      D,(HL)              ; get the data
                       INC     L                   ;
                       LD      E,(HL)              ;
                       DEC     L                   ;
                       LD      C,A                 ;
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      A,C                 ;
                       SUB     $06                 ;
                       LD      C,A                 ;
                       JP      Z,L01C8             ;
L01C1:
                       CALL    RightOneColumn      ; move to next screen position
                       DEC     C                   ;
                       JP      NZ,L01C1            ;
L01C8:
                       LD      A,(HL)              ;
                       LD      (DE),A              ; print one character on the screen
                       JP      L14E0               ; check for coin event

                       .ORG $01D0
;*****************************************************************************
;* Print the top 3 lines (scores, lives, coins)
;*****************************************************************************
PrintTextLines:
                       LD      D,(HL)              ; Get ...
                       INC     L                   ; ... the ...
                       LD      E,(HL)              ; ... screen coord
                       LD      A,L                 ; Add 5 ...
                       ADD     $05                 ; ... go get ...
                       LD      L,A                 ; ... data
                       LD      B,$1A               ; 26 columns
                       CALL    DrawRow             ; Draw next row
                       DEC     C                   ; All lines done?
                       JP      NZ,PrintTextLines   ; No ... draw all rows
                       RET                         ; Done

;*****************************************************************************
;* Print the copyright lines (bottom 3 lines)
;*****************************************************************************
PrintCopyright:
                       CALL    ClearForeAndBackground
L01E4:
                       LD      HL,T1960            ; "PHOENIX ... U.S.A"
                       LD      C,$03               ; 3 lines at the bottom
                       JP      PrintTextLines      ; Print the copyright

                       .ORG $01ED
;*****************************************************************************
;* Remember the screen is rotated.
;* This draws a column in screen memory (row on the screen)
;*****************************************************************************
DrawRow:
                       LD      A,(HL)              ; Copy the data ...
                       LD      (DE),A              ; .. to the screen
                       INC     HL                  ; Next in data
                       CALL    RightOneColumn      ; Move DE to next row
                       DEC     B                   ; All drawn?
                       JP      NZ,DrawRow          ; Draw them all
                       RET                         ; Done

                       .ORG $0200
;*****************************************************************************
;* Two-byte +1 to (HL-1) : (HL).
;*****************************************************************************
AddOneToMem:
                       INC     (HL)                ; Add one to LSB
                       RET     NZ                  ; We didn't overflow ... done
                       DEC     L                   ; Back up to MSB
                       INC     (HL)                ; Carry into the MSB
                       INC     L                   ; Restore point to LSB
                       RET                         ; Done

;*****************************************************************************
;* Two-byte addition. BC is added to (HL-1) : (HL).
;*****************************************************************************
AddBCtoMem:
                       LD      A,(HL)              ; Get the lower byte
                       ADD     A,C                 ; Add C to the lower
                       LD      (HL),A              ; Store the new lower
                       DEC     L                   ; Back up to upper byte
                       LD      A,(HL)              ; Add B and carry ...
                       ADC     A,B                 ; ... to upper byte
                       LD      (HL),A              ; Store the new upper byte
                       INC     L                   ; Restore pointer to LSB
                       RET                         ; Done

                       .ORG $0210
;*****************************************************************************
;* Add 32 (left one column on the rotated screen) to DE (two bytes)
;*****************************************************************************
LeftOneColumn:
                       LD      A,E                 ; Add ...
                       ADD     $20                 ; ... 32 to ...
                       LD      E,A                 ; ... E
                       RET     NC                  ; No carry ... we are done
                       INC     D                   ; Carry into D
                       RET                         ; Done

;*****************************************************************************
;* Subtract 32 (right one column on the rotated screen) from DE (two bytes)
;*****************************************************************************
RightOneColumn:
                       LD      A,E                 ; Subtract ...
                       SUB     $20                 ; ... 32 from ...
                       LD      E,A                 ; ... E
                       RET     NC                  ; No borrow ... we are done
                       DEC     D                   ; Borrow from D
                       RET                         ; Done

                       .ORG $0220
;*****************************************************************************
;* 3-byte (6 digit) BCD addition. Add BC*10 to (HL-2):(HL-1):(HL).
;* The games keeps the lowest digit of the scores to 0.
;*****************************************************************************
AddToScore:
                       XOR     A                   ; !! Pointless. We are about to change A and the flags
                       LD      A,(HL)              ; Lowest 2 digits
                       ADD     A,C                 ; Add C to score
                       DAA                         ; Adjust for binary coded decimal
                       LD      (HL),A              ; Update lowest 2 digits
                       DEC     L                   ; Point to middle 2 digits
                       LD      A,(HL)              ; Add B to ...
                       ADC     A,B                 ; ... score
                       DAA                         ; Adjust for BCD
                       LD      (HL),A              ; Store the middle 2 digits
                       DEC     L                   ; Point to the upper 2 digits
                       LD      A,(HL)              ; Add in ...
                       ADC     $00                 ; ... any carry
                       DAA                         ; Adjust for binary coded decimal
                       LD      (HL),A              ; Store the upper 2 digits
                       INC     L                   ; Restore ...
                       INC     L                   ; ... pointer
                       RET                         ; Done

                       .ORG $0258
;*****************************************************************************
;* Two byte compare of BC to memory at (HL-1):(HL)
;*****************************************************************************
CompareBCtoMem:
                       LD      A,(HL)              ; Value from memory
                       CP      C                   ; Are the lower values the same?
                       RET     NZ                  ; No ... return not-zero
                       DEC     L                   ; Point to MSB
                       LD      A,(HL)              ; Get the MSB value
                       INC     L                   ; Restore the pointer
                       CP      B                   ; Compare the MSBs
                       RET                         ; Return the flags

;*****************************************************************************
;* Subtract DE from memory if memory is greater/equal to BC.
;*****************************************************************************
SubtractIfEnough:
                       CALL    SubtractFromMemory  ; Try subtraction. Is memory larger (or equal) to BC?
                       RET     C                   ; No ... ignore request
                       CALL    SubtractToMemory    ; Yes ... subtract DE from memory
                       RET                         ; Done

                       .ORG $0270
;*****************************************************************************
;* Two byte subtraction of memory from BC. BC = BC -  (HL-1):(HL)
;*****************************************************************************
SubtractFromMemory:
                       LD      A,(HL)              ; Get the low byte
                       SUB     C                   ; Subtract from C
                       DEC     L                   ; Point to upper byte
                       LD      A,(HL)              ; Get the upper byte
                       SBC     B                   ; Subtract from B (with borrow)
                       INC     L                   ; Restore pointer
                       RET                         ; Done

;*****************************************************************************
;* Two byte subtraction of DE from memory. (HL-1):(HL) = (HL-1):(HL) - DE
;*****************************************************************************
SubtractToMemory:
                       LD      A,E                 ; Lower byte
                       SUB     (HL)                ; Subtract it from memory
                       DEC     L                   ; Point to upper byte
                       LD      A,D                 ; Value to A
                       SBC     (HL)                ; Subtract upper byte from memory (with borrow)
                       INC     L                   ; Restore pointer
                       RET                         ; Done

                       .ORG $0280
;*****************************************************************************
;* Two byte compare of HL to BC
;*****************************************************************************
CompareHLtoBC:
                       LD      A,L                 ; Compare lower ...
                       CP      C                   ; ... bytes
                       RET     NZ                  ; Not the same ... return NZ
                       LD      A,H                 ; Compare upper ...
                       CP      B                   ; ... bytes
                       RET                         ; Return the check

                       .ORG $0288
;*****************************************************************************
;* Start game screen
;*****************************************************************************
PromptForStartGame:
                       CALL    ClearForeAndBackground
                       LD      HL,T19C0            ; 
                       LD      C,$02               ; print two lines: 'PUSH ONLY...1PLAYER BUTTON'
                       CALL    PrintTextLines      ;
                       LD      C,$02               ;
                       CALL    CoinChecking        ;
                       CP      $02                 ; 2 player mode possible if credit > 1
                       JP      C,L02A7             ;
                       LD      HL,T1BA0            ;
                       LD      C,$01               ; print one line: '1 OR 2PLAYERS BUTTON'
                       CALL    PrintTextLines      ;
                       LD      C,$06               ;
L02A7:
                       LD      A,(IN0)             ; 70xx IN0  Get the bits...
                       CPL                         ; ...for the two...
                       AND     C                   ; ...start buttons and...
                       RET     Z                   ; ...ret if no start button was pressed.
                       CALL    DecrementCoins      ; (GameOrAttract will be affected here as well)
                       CALL    UpdateHiScore       ;
                       CALL    ClearAndPrintScores ;
                       CALL    GetPlayerLivesFromDip
                       CALL    ClearForeAndBackground
                       LD      H,videoRegister >> 8
                       LD      (HL),$01            ;
                       CALL    ClearForeAndBackground
                       LD      H,videoRegister >> 8
                       LD      (HL),$00            ;
                       RET                         ;

                       .ORG $02CB
;*****************************************************************************
;* Coin handling
;*****************************************************************************
DecrementCoins:
                       LD      C,$01               ; Value for 'one player game mode'
                       CP      $02                 ; A register holds the value of start buttons
                       JP      Z,L02D4             ; jump if 'start 1' was pressed.
                       LD      C,$02               ; Value for 'two players game mode'
L02D4:
                       LD      HL,GameOrAttract    ; 
                       LD      (HL),C              ; set it to 1 or 2 and leave the attract mode.
                       LD      A,(DSW0)            ; 78xx DSW0
                       AND     $10                 ; mask for coinage 0001_0000
                       JP      Z,L02E3             ;
                       LD      A,C                 ;
                       RLCA                        ; Multiply by 2
                       LD      C,A                 ;
L02E3:
                       LD      L,CoinCount & $FF   ; LSB of CoinCount
                       LD      A,(HL)              ; get CoinCount value
                       SUB     C                   ; decrement coins
                       LD      (HL),A              ; save it
                       ADD     $20                 ; map value to character code
                       LD      (ForegroundScreen+$142),A ; updates the number of coins on the screen
                       RET                         ;

                       .ORG $02F0
;*****************************************************************************
;* Copy the score to hi score if greater
;*****************************************************************************
UpdateHiScore:
                       LD      DE,Score1low        ; score of player 1
                       LD      HL,HiScorelow       ; current hi score
                       CALL    L0314               ;
                       CALL    NC,L0320            ;
                       LD      E,Score2low & $FF   ; LSB of Score2low
                       LD      L,HiScorelow & $FF  ; LSB of HiScorelow
                       CALL    L0314               ;
                       CALL    NC,L0320            ;
                       LD      L,HiScorelow & $FF  ; LSB of HiScorelow
                       LD      DE,$4141            ; High-score Screen coordinates (LSB)
                       LD      B,$06               ; 6 digits
                       CALL    PrintNumber         ; Print the 6-digit number
                       RET                         ; Done

                       .ORG $0314
L0314:
                       LD      A,(DE)              ;
                       SUB     (HL)                ;
                       DEC     E                   ;
                       DEC     L                   ;
                       LD      A,(DE)              ;
                       SBC     (HL)                ;
                       DEC     E                   ;
                       DEC     L                   ;
                       LD      A,(DE)              ;
                       SBC     (HL)                ;
                       RET                         ;

                       .ORG $0320
L0320:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       RET                         ;

                       .ORG $032E
;*****************************************************************************
;* Update of the score values on screen.
;*****************************************************************************
ClearAndPrintScores:
                       LD      HL,M4380            ; Clear scores..
L0331:
                       LD      (HL),$00            ; ..from $4380..
                       INC     HL                  ;
                       LD      A,L                 ;
                       CP      $88                 ; ..to $4387
                       JP      NZ,L0331            ;
                       LD      L,Score1low & $FF   ; print player 1 score
                       LD      DE,$4261            ; Score1 screen coordinates (LSB)
                       LD      B,$06               ; 6 digits
                       CALL    PrintNumber         ;
                       LD      L,Score2low & $FF   ; print player 2 score
                       LD      DE,$4021            ; Score2 screen coordinates (LSB)
                       LD      B,$06               ; 6 digits
                       CALL    PrintNumber         ;
                       RET                         ; Done

                       .ORG $0350
;*****************************************************************************
;* Gets the DIP switch settings for player lives.
;*****************************************************************************
GetPlayerLivesFromDip:
                       LD      A,(DSW0)            ; 78xx DSW0, get DIP switch settings
                       AND     $03                 ; mask out 0000_0011 number of lives
                       ADD     $03                 ; to get : 03, 04, 05 or 06
                       LD      B,A                 ;
                       LD      HL,Player1Lives     ;
                       LD      (HL),B              ; save it
                       LD      L,GameOrAttract & $FF
                       LD      A,(HL)              ; load GameOrAttract and ..
                       CP      $01                 ; check if one or two players mode
                       JP      Z,UpdateLivesScreen ;
                       LD      L,Player2Lives & $FF
                       LD      (HL),B              ; save it to Player2Lives

;*****************************************************************************
;* Updates the number of lives on the screen
;*****************************************************************************
UpdateLivesScreen:
                       LD      L,Player1Lives & $FF
                       LD      A,(HL)              ; load Player1Lives
                       OR      $20                 ; map value to character code
                       LD      (ForegroundScreen+$2A2),A ; number of lives, for player 1 at screen ram
                       INC     L                   ;
                       LD      A,(HL)              ; load Player2Lives
                       OR      $20                 ; map value to character code
                       LD      (ForegroundScreen+$62),A ; number of lives, for player 2 at screen ram
                       RET                         ;

;*****************************************************************************
;* Update the sound control RAM registers
;*****************************************************************************
UpdateSoundControlRAM:
                       LD      HL,SoundControlA    ;
                       LD      (HL),A              ;
                       INC     L                   ; and update ..
                       LD      (HL),A              ; .. SoundControlB
                       RET                         ;

                       .ORG $0380
;*****************************************************************************
;* Clears the foreground except for the top 3 rows (the scores)
;*****************************************************************************
ClearForeground:
                       LD      HL,ForegroundScreen+$33F       ; End of foreground screen
                       LD      DE,$001F            ; 00 for clear and 1F for finding end of a column
                       LD      BC,$033F            ; 03 for leaving top 3 rows and 3F for find the beginning of screen memory
L0389:
                       LD      (HL),D              ; Clear the screen
                       DEC     HL                  ; Next location
                       LD      (HL),D              ; Clear the screen
                       DEC     HL                  ; Next location
                       LD      A,L                 ; Keep lower 5 ...
                       AND     E                   ; ... bits (32 bytes in a column)
                       CP      B                   ; At the top of the column?
                       JP      NZ,L0389            ; No ... keep clearing the column
                       LD      (HL),D              ; Clear the 4th column from the top
                       DEC     HL                  ; To ...
                       DEC     HL                  ; ... top ...
                       DEC     HL                  ; ... of the ...
                       DEC     HL                  ; ... row
                       LD      A,H                 ; Have we reached ...
                       CP      C                   ; ... 3FFF ?
                       JP      NZ,L0389            ; No ... clear all columns
                       RET                         ; Done

                       .ORG $03A0
;*****************************************************************************
;* Clears the background screen.
;*****************************************************************************
ClearBackground:
                       LD      HL,BackgroundScreen+$33F       ; End of background screen memory
                       LD      DE,$0047            ; 00 for clear and 47 to find the beginning of screen memory
L03A6:
                       LD      (HL),D              ; Clear the screen
                       DEC     HL                  ; Next location
                       LD      (HL),D              ; Clear the screen
                       DEC     HL                  ; Next location
                       LD      A,H                 ; Have we reached ...
                       CP      E                   ; HL = 47FF ?
                       JP      NZ,L03A6            ; No ... keep clearing
                       RET                         ; Done

;*****************************************************************************
;* The game demo is using the real game code with simulated player inputs.
;* The timeline of the game demo, as part of the attract mode,
;* is covered by a 16 bit counter $4398:$4399.
;* 1st demo from value: $03E6 to $07A0.
;* 2nd demo from value: $0800 to $0B60.
;* 3rd demo from value: $0C00 to $1510.
;*****************************************************************************
GameDemo:
                       LD      BC,$07A0            ;
                       CALL    SubtractFromMemory  ;
                       JP      C,L03CE             ;
                       CALL    CompareBCtoMem      ;
                       JP      Z,L03EB             ;
                       LD      BC,$0B60            ;
                       CALL    SubtractFromMemory  ;
                       JP      C,L03CE             ;
                       CALL    CompareBCtoMem      ;
                       JP      Z,L03E2             ;
L03CE:
                       CALL    GetPlayerInputsForDemo
                       LD      HL,IN0Current       ;
                       LD      A,(HL)              ;
                       AND     $01                 ; mask out real button presses, but leave the coin event.
                       OR      B                   ; feed the IN0Current with movement data
                       LD      (HL),A              ; for the game demo.
                       JP      GameStateMachine    ;

                       .ORG $03E2
; Used for changing the game demo level at attract mode.
L03E2:
                       LD      BC,$0108            ; Next interval game state is 1, set LevelAndRound to 1st round, level 8 (mothership wave)
                       LD      DE,$1000            ; set AliensLeft to 1 and BirdsLeft to 0 ?
                       JP      L03F1               ; 

; Used for changing the game demo level at attract mode.
L03EB:
                       LD      BC,$0104            ;
                       LD      DE,$0008            ;
L03F1:
                       LD      HL,GameState        ; Next interval game state ...
                       LD      (HL),B              ; ... is 1 (flashing of score)
                       LD      L,$B8               ;
                       LD      (HL),C              ; set LevelAndRound to 1st round, level 4 (blue birds wave)
                       LD      L,$BA               ;
                       LD      (HL),D              ; set AliensLeft to 0
                       INC     L                   ;
                       LD      (HL),E              ; set BirdsLeft to 8
                       RET                         ;

                       .ORG $0400
;*****************************************************************************
;* Game state machine.
;* Jump to function by number in GameState.
;*****************************************************************************
GameStateMachine:
                       LD      HL,T040E            ; Jump table
                       LD      A,(GameState)       ;
                       RLCA                        ; *2
                       ADD     A,L                 ; Offset ...
                       LD      L,A                 ; ... into the table
                       LD      A,(HL)              ; MSB of destination
                       INC     L                   ; Get the
                       LD      L,(HL)              ; ... LSB of destination
                       LD      H,A                 ; Now point to function
                       JP      (HL)                ; Jump to function

; Notice these addresses are MSB:LSB (backwards from the processor's endianness)
T040E:
                       .MSFIRST
                       .DW L0430                   ; game state 0: called once at 'new game start'
                       .DW L04AC                   ; game state 1: called for each frame during 'flashing of score1 or 2'
                       .DW L0515                   ; game state 2: called once for initialization of game and level data
                       .DW L0800                   ; game state 3: called for each frame of normal game play
                       .DW L0AEA                   ; game state 4: called for each frame of 'player ship partikel explosion'
                       .DW L0B60                   ; game state 5: called for each frame during 'GAME OVER' text
                       .DW L2400                   ; game state 6: called for each frame during 'mother ship partikel explosion'
                       .DW L244C                   ; game state 7: called for each frame during 'mother ship score display'

;*****************************************************************************
;* Set lower bits of video register,
;* for the color palette, memory bank, and the screen flipping at cocktail mode.
;*****************************************************************************
SetBitsVideoRegister:
                       LD      A,(GameAndDemoOrSplash)
                       AND     $01                 ; mask out 0000_0001 for 'memory bank'
                       LD      B,A                 ;
                       LD      A,(LevelAndRound)   ;
                       AND     $02                 ; masc out 0000_0010 for 'color palette'
                       OR      B                   ; set the bits at...
                       LD      (videoRegister),A   ; 50xx video register
                       RET                         ;

                       .ORG $0430
;*****************************************************************************
;* Game state 0.
;* New game start.
;*****************************************************************************
L0430:
                       LD      HL,GameState        ; Next interval game state ...
                       LD      (HL),$01            ; ... is 1 (flashing of score)
                       INC     L                   ;
                       LD      (HL),$80            ; Set value for CounterA5 (score flash time)
                       LD      L,GameAndDemoOrSplash & $FF   ; save the value of..
                       LD      A,(HL)              ; .. GameAndDemoOrSplash
                       LD      (HL),$00            ; set it to game demo / game play
                       CP      $02                 ;
                       RET     Z                   ; return if it was 'Intro splash' before.
                       LD      (HL),A              ; set GameAndDemoOrSplash to 'Game and demo for player 1'
                       DEC     L                   ;
                       LD      A,(HL)              ; get GameOrAttract
                       CP      $01                 ;
                       RET     Z                   ; return if 'One player game mode'
                       INC     L                   ;
                       LD      A,(HL)              ; get GameAndDemoOrSplash
                       AND     A                   ; updates the zero flag
                       JP      Z,L04A0             ; if 'Game and demo'
                       LD      L,$90               ;
                       LD      A,(HL)              ; get Player1Lives
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; return if no lives left.
                       LD      L,$A3               ;
                       LD      (HL),$00            ; set GameAndDemoOrSplash to 'Game and demo for player 1'
                       LD      BC,$0100            ; from bank 1 to bank 0
                       CALL    CopyMemoryBank      ; to toggle the player
                       RET                         ;

                       .ORG $0460
;*****************************************************************************
;* Copy memory bank to bank
;* B=from bank number, C=to bank number
;* Starts at 4320
;*****************************************************************************
CopyMemoryBank:
                       LD      HL,videoRegister    ; 50xx video register
                       LD      DE,ForegroundScreen+$320; 1st row 1st line
L0466:
                       LD      (HL),B              ;
                       LD      A,(DE)              ;
                       LD      (HL),C              ;
                       LD      (DE),A              ;
                       INC     E                   ;
                       LD      A,E                 ;
                       AND     $03                 ;
                       JP      NZ,L0466            ;
                       LD      A,E                 ;
                       AND     $F0                 ;
                       SUB     $20                 ;
                       LD      E,A                 ;
                       JP      NC,L0466            ;
                       DEC     D                   ;
                       LD      A,D                 ;
                       CP      $3F                 ;
                       JP      NZ,L0466            ;
                       LD      DE,M4380            ;
L0484:
                       LD      (HL),B              ;
                       LD      A,(DE)              ;
                       LD      (HL),C              ;
                       LD      (DE),A              ;
                       INC     E                   ;
                       LD      A,E                 ;
                       CP      $B8                 ;
                       JP      NZ,L0484            ;
                       LD      DE,M4BC0            ;
L0492:
                       LD      (HL),B              ;
                       LD      A,(DE)              ;
                       LD      (HL),C              ;
                       LD      (DE),A              ;
                       INC     E                   ;
                       LD      A,E                 ;
                       CP      $00                 ;
                       JP      NZ,L0492            ;
                       RET                         ;

                       .ORG $04A0
L04A0:
                       LD      L,$A3               ; set GameAndDemoOrSplash
                       LD      (HL),$01            ; to 'Game for player 2'
                       LD      BC,$0001            ; from bank 0 to bank 1
                       CALL    CopyMemoryBank      ; to toggle the player
                       RET                         ;

                       .ORG $04AC
;*****************************************************************************
;* Game state 1.
;* Flashing of score1 or 2.
;*****************************************************************************
L04AC:
                       LD      HL,CounterA5        ;
                       DEC     (HL)                ; decrement counter
                       LD      A,(HL)              ; save value
                       DEC     L                   ; HL=A3A4 next game state ..
                       LD      (HL),$02            ; .. is 2
                       AND     A                   ; ret if ..
                       RET     Z                   ; counter 0
                       LD      (HL),$01            ; set game state to 1
                       CP      $7F                 ; 0111_1111
                       JP      Z,L07F0             ;
                       LD      L,$9A               ;
                       LD      (HL),$00            ; reset Counter9A MSB
                       INC     L                   ; and ..
                       LD      (HL),$00            ; LSB
                       AND     $08                 ; 0000_1000
                       JP      NZ,L04E6            ;
                       CALL    L06E8               ;
                       NOP                         ;
                       LD      HL,GameAndDemoOrSplash
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       LD      L,$83               ; LSB of Score1low adress
                       LD      DE,$4261            ; screen ram addr. of lowest score digit player 1
                       JP      Z,L04DF             ; 
                       LD      L,$87               ; LSB of Score2low adress
                       LD      DE,$4021            ; screen ram addr. of lowest score digit player 2
L04DF:
                       LD      B,$06               ; number of digits to print
                       CALL    PrintNumber         ;
                       RET                         ;

                       .ORG $04E6
L04E6:
                       LD      HL,GameAndDemoOrSplash
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       LD      DE,$4261            ; screen ram addr. of lowest score digit player 1
                       JP      Z,L04F4             ;
                       LD      DE,$4021            ; screen ram addr. of lowest score digit player 2
L04F4:
                       LD      B,$06               ; number of digits to delete
                       CALL    L04FB               ;
                       RET                         ;

                       .ORG $04FB
L04FB:
                       LD      A,$00               ; delete ..
                       LD      (DE),A              ; ..one digit
                       CALL    LeftOneColumn       ;
                       DEC     B                   ; decrement number of digits
                       JP      NZ,L04FB            ; ..until
                       RET                         ; ..done

;
L0506:
                       LD      HL,M4392            ;
                       LD      B,$06               ; number of bytes to clear
                       CALL    ClearBbytesAtHL     ;
                       LD      A,(M4B50)           ;
                       LD      (M4394),A           ;
                       RET                         ;

;*****************************************************************************
;* Game state 2.
;* Initialization of game and level data.
;*****************************************************************************
L0515:
                       CALL    SetBitsVideoRegister; set color palette according to LevelAndRound
                       LD      HL,GameState        ; Next interval game state ...
                       LD      (HL),$03            ; ... is 3 (normal game play)
                       CALL    InitGlobalLevelData ;
                       CALL    InitPlayerDataStructure
                       CALL    L09A0               ; get screen ram adress for player ship position
L0526:
                       CALL    L0532               ; init alien data for a new level and round
                       CALL    L0A6C               ; get screen ram adress for all aliens
                       CALL    L0506               ; clear 4392 to 4397, init 4394
                       JP      L32B0               ;

;*****************************************************************************
;* Init alien data for a new level and round
;*****************************************************************************
L0532:
                       LD      HL,M4B50            ;
                       LD      B,$A0               ; clear $4B50 to $4BEF
                       CALL    ClearBbytesAtHL     ;
                       CALL    InitAlienControlStates
                       CALL    L0650               ; copy init values for 16 aliens to $4B50-$4B6F
                       CALL    InitAlienPositions  ; load alien screen coordinates (X,Y grid), for a new level and round
                       RET                         ;

                       .ORG $0547
;*****************************************************************************
;* Copy 32 byte from $0560 to $43C0 Player and bullets data structure (grid)
;* and clear 32 bytes of player and bullets data structure (screen ram).
;*****************************************************************************
InitPlayerDataStructure:
                       LD      HL,T0560            ;
                       LD      DE,PlayerState      ; base of data structure (grid)
                       LD      B,$20               ;
                       CALL    CopyBbytesHLtoDE    ;
                       LD      HL,OldPlayerShipMSB ;
                       LD      B,$20               ;
                       CALL    ClearBbytesAtHL     ;
                       RET                         ;

                       .ORG $0560
; Data copied to $43C0-$43DF
; Default values for player and bullets data structure (grid).
T0560:
                       .DB $0C, $10, $64, $D8       ; PlayerState, PlayerShape, PlayerShipX, PlayerShipY
                       .DB $00, $50, $00, $D0       ; PlayerBulletState, PlayerBulletShape, PlayerBulletX, PlayerBulletY
                       .DB $00, $50, $00, $D0       ; AbovePlayerBulletState, AbovePlayerBulletShape, AbovePlayerBulletX, AbovePlayerBulletY
                       .DB $00, $58, $00, $20       ; AlienBullet0State, AlienBullet0Shape, AlienBullet0X, AlienBullet0Y
                       .DB $00, $58, $00, $20       ; AlienBullet1State, AlienBullet1Shape, AlienBullet1X, AlienBullet1Y
                       .DB $00, $58, $00, $20       ; AlienBullet2State, AlienBullet2Shape, AlienBullet2X, AlienBullet2Y
                       .DB $00, $58, $00, $20       ; AlienBullet3State, AlienBullet3Shape, AlienBullet3X, AlienBullet3Y
                       .DB $00, $58, $00, $20       ; AlienBullet4State, AlienBullet4Shape, AlienBullet4X, AlienBullet4Y

;*****************************************************************************
;* Init of global level data, dependent on level and round.
;*****************************************************************************
InitGlobalLevelData:
                       LD      HL,T0598            ;
                       LD      A,(LevelAndRound)   ;
                       AND     $0F                 ;
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      L,(HL)              ;
                       LD      H,$05               ;
                       LD      DE,M43AB            ;
                       LD      B,$0C               ; number of bytes to copy
                       CALL    CopyBbytesHLtoDE    ;
                       RET                         ;

                       .ORG $0598
; Table for the global level data, over game levels.
; Bit0 - bit3 of $43B8 is the table index.
; Data will be fetched two times. Once before and once after the 'spiral fill' animation.
T0598:
                       .DB T05A8 & $FF, T05A8 & $FF    ;init values for 1st alien wave (pointer to $05A8, $05A8)
                       .DB T05C0 & $FF, T05C0 & $FF    ;init values for 2st alien wave (pointer to $05C0, $05C0)
                       .DB T05A8 & $FF, T05A8 & $FF    ;init values for blue birds wave (pointer to $05A8, $05A8)
                       .DB T05A8 & $FF, T05A8 & $FF    ;init values for pink birds wave (pointer to $05A8, $05A8)
                       .DB T05B4 & $FF, T05CC & $FF    ;init values for mothership wave (pointer to $05B4, $05CC)
                       .DB T05B4 & $FF, T05B4 & $FF    ;init values for mothership wave (pointer to $05B4, $05B4)
                       .DB T05A8 & $FF, T05A8 & $FF    ;not used? pointer to $05A8, $05A8
                       .DB T05A8 & $FF, T05A8 & $FF    ;not used? pointer to $05A8, $05A8
;
; e.g.:counter values, timer values, T1C00, T1D00, T1F00, ..
; Data copied to $43AB-$43B6
T05A8:
                       .DB $80, $7F, $00, $00, $40, $3F, $00, T1C00 >> 8, T1C00 & $FF, $FF, $FF, $FF
T05B4:
                       .DB $60, $5F, $01, $02, $30, $2F, $00, T1C00 >> 8, T1C00 & $FF, $C0, $FF, $FF
T05C0:
                       .DB $80, $7F, $03, $04, $40, $3F, $00, T1F00 >> 8, T1F00 & $FF, $A0, $FF, $FF
T05CC:
                       .DB $60, $60, $05, $06, $50, $30, $00, T1D00 >> 8, T1D00 & $FF, $48, $FF, $FF

;*****************************************************************************
;* Clears B memories starting at HL.
;*****************************************************************************
ClearBbytesAtHL:
                       XOR     A                   ; A=0
L05D9:
                       LD      (HL),A              ; store
                       INC     HL                  ; next
                       DEC     B                   ; decrease counter.
                       JP      NZ,L05D9            ;
                       RET                         ;

;*****************************************************************************
;* Copy number of bytes (B register) from DE to HL.
;*****************************************************************************
CopyBbytesHLtoDE:
                       LD      A,(HL)              ; Copy to HL ...
                       LD      (DE),A              ; ... from DE
                       INC     HL                  ; Next destination
                       INC     DE                  ; Next source
                       DEC     B                   ; All done?
                       JP      NZ,CopyBbytesHLtoDE ; no ... keep going
                       RET                         ; Out

                       .ORG $05EC
;*****************************************************************************
;* Init all alien control states for a given level and round.
;*****************************************************************************
InitAlienControlStates:
                       LD      HL,T1500            ;
                       LD      A,(LevelAndRound)   ;
                       AND     $0F                 ;
                       RLCA                        ; Multiply by 2
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
;
L05FA:
                       LD      HL,M4B70            ;
                       LD      A,(AliensLeft)      ;
                       LD      B,A                 ;
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if no AliensLeft
;
L0603:
                       LD      (HL),D              ; set control state A
                       INC     L                   ;
                       LD      (HL),E              ; set control state B
                       INC     L                   ;
                       INC     L                   ;
                       INC     L                   ;
                       DEC     B                   ; number of aliens left
                       JP      NZ,L0603            ;
                       RET                         ;

                       .ORG $0610
;*****************************************************************************
;* Load alien screen coordinates for a given level and round to $4B70 - $4BAF.
;*****************************************************************************
InitAlienPositions:
                       LD      HL,T063A            ;
                       LD      A,(LevelAndRound)   ;
                       RRCA                        ;
                       AND     $0F                 ; mask out 0000_1111
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       NOP                         ; Old command removed or space for a future replace patch
                       NOP                         ; ..
                       NOP                         ; ..
                       LD      L,(HL)              ;
                       LD      H,T1540 >> 8        ; MSB for T1540-T15E0
                       LD      DE,M4B72            ;
                       LD      A,(AliensLeft)      ;
                       LD      B,A                 ;
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if no AliensLeft
;
L062A:
                       LD      A,(HL)              ; get value from table
                       LD      (DE),A              ; save to alien screen coordinate
                       INC     HL                  ;
                       INC     DE                  ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ;
                       INC     HL                  ;
                       INC     DE                  ;
                       INC     DE                  ;
                       INC     DE                  ;
                       DEC     B                   ;
                       JP      NZ,L062A            ; loop for all AliensLeft
                       RET                         ;

                       .ORG $063A
; Init data for 1st game round.
; LSB's for T1560, T1540, T15E0.
T063A:
                       .DB T1560 & $FF, T1540 & $FF, T15E0 & $FF, T15E0 & $FF, T15E0 & $FF, T15E0 & $FF, $FF, $FF
; Init data for 2nd game round.
; LSB's for T15C0, T15A0, T1580.
                       .DB T15C0 & $FF, T15A0 & $FF, T1580 & $FF, T1580 & $FF, T1580 & $FF, T1580 & $FF, $FF, $FF

                       .ORG $0650
L0650:
                       LD      HL,T1520            ;
                       LD      A,(LevelAndRound)   ;
                       AND     $0F                 ; mask out 0000_1111
                       RLCA                        ; Multiply by 2
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
                       LD      HL,M4B50            ;
                       LD      A,(AliensLeft)      ;
                       LD      B,A                 ;
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if no AliensLeft
L0667:
                       LD      (HL),D              ;
                       INC     L                   ;
                       LD      (HL),E              ;
                       INC     L                   ;
                       DEC     B                   ;
                       JP      NZ,L0667            ; loop for all AliensLeft
                       RET                         ;

                       .ORG $067A
;*****************************************************************************
;* Scroll down the background screen one pixel.
;*****************************************************************************
StarsScrollDown:
                       LD      HL,CounterB9        ;
                       LD      A,(HL)              ;
                       DEC     (HL)                ; decrement the backwards counter
                       LD      (scrollRegister),A  ; 58xx scroll register
                       AND     $07                 ; mask out 0000_0111
                       RET     NZ                  ; continue after 8 pixels...
; Fill the background with stars or mothership.
                       LD      BC,$2047            ;
                       LD      DE,$4B21            ; get character from the background screen (1st row, 2nd line)
                       LD      A,(HL)              ; get $43B9 free running 8 bit backwards counter value
                       RRCA                        ;
                       RRCA                        ;
                       RRCA                        ;
                       AND     $1F                 ; mask out 0001_1111
                       ADD     A,E                 ;
                       LD      E,A                 ;
                       LD      L,$B2               ;
                       LD      A,(HL)              ; get $43B2 (MSB of T1C00 or T1D00 or T1F00)
                       INC     L                   ;
                       LD      L,(HL)              ; get $43B3 (LSB of T1C00 or T1D00 or T1F00)
                       LD      H,A                 ;
L0699:
                       LD      A,(HL)              ;
                       LD      (DE),A              ; to background screen
                       INC     L                   ;
                       LD      A,E                 ;
                       SUB     B                   ;
                       LD      E,A                 ;
                       JP      NC,L0699            ;
                       DEC     D                   ;
                       LD      A,D                 ;
                       CP      C                   ;
                       JP      NZ,L0699            ;
                       LD      A,L                 ;
                       LD      (M43B3),A           ;
                       RET                         ;

                       .ORG $06B0
;*****************************************************************************
;* Fill the background with (2x2) planets.
;*****************************************************************************
AddPlanetsToBackground:
                       LD      HL,M43AB            ; counter value for (2x2) planets
                       LD      A,(CounterB9)       ;
                       LD      C,A                 ;
                       CP      (HL)                ;
                       RET     NZ                  ;
                       LD      A,(HL)              ;
                       INC     L                   ;
                       ADD     A,(HL)              ;
                       DEC     L                   ;
                       LD      (HL),A              ;
                       INC     L                   ;
                       INC     L                   ;
                       INC     (HL)                ;
                       LD      B,(HL)              ;
                       INC     L                   ;
                       INC     (HL)                ;
                       LD      A,(HL)              ;
                       LD      HL,T1E20            ; MSB's of screen ram for planets
                       AND     $1F                 ;
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      D,(HL)              ;
                       ADD     $20                 ;
                       LD      L,A                 ;
                       LD      E,(HL)              ;
                       LD      A,C                 ;
                       RRCA                        ;
                       RRCA                        ;
                       RRCA                        ;
                       AND     $1E                 ;
                       ADD     A,E                 ;
                       ADD     $02                 ;
                       LD      E,A                 ;
                       LD      HL,T1E60            ; LSB's of screen ram for planets
                       LD      A,B                 ;
                       AND     $1F                 ;
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      L,(HL)              ;
                       CALL    L07DC               ; draw the characters at background
                       RET                         ;
;
L06E8:
                       LD      HL,T1800            ; base addr. table for 'screen ram adresses and static texts'
                       LD      C,$01               ; 1 column (rotated to 1 row)
                       JP      PrintTextLines      ;

; Update scroll register and fill background
L06F0:
                       CALL    StarsScrollDown     ;
                       CALL    AddGalaxiesToBackground
                       JP      AddPlanetsToBackground

                       .ORG $0700
;*****************************************************************************
;* Controller for player data structure.
;* Handles: PlayerState, $43E0, PlayerBulletState, $43E4, AbovePlayerBulletState, $43E8
;*****************************************************************************
PlayerDataController:
                       LD      BC,PlayerState      ; Player data structure (grid)
                       LD      DE,OldPlayerShipMSB ; Player data structure (screen ram)
L0706:
                       CALL    UpdateScreenObjects ;
                       LD      A,C                 ;
                       ADD     $04                 ;
                       LD      C,A                 ;
                       ADD     $20                 ;
                       LD      E,A                 ;
                       LD      D,B                 ;
                       CP      $EC                 ;
                       JP      NZ,L0706            ; loop until $43EC
                       RET                         ;

                       .ORG $0718
;*****************************************************************************
;* Draw or delete screen objects dep. on control state of player, alien and bullet.
;*****************************************************************************
UpdateScreenObjects:
                       CALL    Bit4Controller      ; for deleting screen objects
                       JP      Bit3Controller      ; for drawing screen objects

                       .ORG $0720
;*****************************************************************************
;* Handles the bit4 actions for deleting screen objects.
;*****************************************************************************
Bit4Controller:
                       LD      A,(BC)              ; get value from data structure (grid)
                       LD      H,A                 ; save the bits
                       AND     $10                 ; mask out 0001_0000 (bit4 of control state A)
                       RET     Z                   ; ret if bit not set.
                       LD      A,H                 ; restore the bits
                       AND     $EF                 ; mask out 1110_1111
                       LD      (BC),A              ; save to control state A
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       AND     $07                 ; mask out 0000_0111
                       ADD     $38                 ; add to base for jump table
                       LD      L,A                 ;
                       LD      H,T0735 >> 8        ; MSB for jump table
                       LD      L,(HL)              ;
                       JP      (HL)                ; jump to control function

; LSB jump table:
;.....not used
;........not used
;...........not used
;..............0763..................control state A: 0001_xxxx...Delete 1x1 screen objects.
;.................0779...............control state A: 0011_xxxx...Delete 2x1 screen objects.
;....................not used
;.......................079E.........control state A: 0111_xxxx...Delete 1x2 screen objects.
;..........................07BE......control state A: 1001_xxxx...Delete 2x2 screen objects.
T0735:
                       .DB $00, $00, $00, L0763 & $FF, L0779 & $FF, $00, L079E & $FF, L07BE & $FF

                       .ORG $0740
;*****************************************************************************
;* Handles the bit3 actions for drawing screen objects.
;*****************************************************************************
Bit3Controller:
                       LD      A,(BC)              ; get value from data structure (grid)
                       LD      H,A                 ; save it
                       AND     $08                 ; mask out 0000_1000 (bit3 of control state A)
                       RET     Z                   ; ret if bit not set.
                       LD      A,H                 ; restore the bits
                       AND     $07                 ; mask out 0000_0111
                       LD      H,A                 ; save it
                       RRCA                        ; Divide by 8 ..
                       RRCA                        ; ..
                       RRCA                        ; ..
                       OR      H                   ; add original bits
                       OR      $18                 ; set 0001_1000 flag
                       LD      (BC),A              ; set the bits at control state A
                       INC     BC                  ; go to control state B
                       LD      A,H                 ;
                       ADD     $5B                 ; add to base for jump table
                       LD      L,A                 ;
                       LD      H,T0759 >> 8        ; MSB for jump table
                       LD      L,(HL)              ;
                       JP      (HL)                ; jump to control function

; LSB jump table:
;.....not used
;........not used
;...........076D.....................control state A: xxxx_1000...Draw 1x1 screen objects.
;..............0788..................control state A: xxxx_1001...Draw 2x1 screen objects.
;.................not used
;....................07AA............control state A: xxxx_1011...Draw 1x2 screen objects.
;.......................07D2.........control state A: xxxx_1100...Draw 2x2 screen objects.
;..........................not used
T0759:
                       .DB $00, $00, L076D & $FF, L0788 & $FF, $00, L07AA & $FF, L07D2 & $FF

                       .ORG $0763
;*****************************************************************************
;* Bit4 control function 63:
;* If control state A: 0001_xxxx
;* Delete 1x1 screen objects (bullet, alien).
;*****************************************************************************
L0763:
                       EX      DE,HL               ;
                       LD      D,(HL)              ; get screen ram adress MSB
                       INC     HL                  ;
                       LD      E,(HL)              ; get screen ram adress LSB
                       DEC     HL                  ; restore pointer
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete at screen
                       EX      DE,HL               ;
                       RET                         ;

                       .ORG $076D
;*****************************************************************************
;* Bit3 control function 6D:
;* If control state A: xxxx_1000
;* Set alien control state B value to screen ram.
;* Draw 1x1 screen objects (used at 'fade in' animation).
;*****************************************************************************
L076D:
                       EX      DE,HL               ;
                       INC     HL                  ;
                       INC     HL                  ;
                       LD      D,(HL)              ; get MSB screen ram adress of alien
                       INC     HL                  ;
                       LD      E,(HL)              ; get LSB screen ram adress of alien
                       LD      A,(BC)              ; get alien control state B
                       LD      (DE),A              ; set at screen ram
                       DEC     BC                  ; move to alien control state A
                       RET                         ;

                       .ORG $0779
;*****************************************************************************
;* Bit4 control function 79:
;* If control state A: 0011_xxxx
;* Delete 2x1 screen objects (alien).
;*****************************************************************************
L0779:
                       EX      DE,HL               ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
                       DEC     HL                  ; restore pointer
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete at screen, left part
                       CALL    RightOneColumn      ; 
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete at screen, right part
                       EX      DE,HL               ;
                       RET                         ;

                       .ORG $0788
;*****************************************************************************
;* Bit3 control function 88:
;* If control state A: xxxx_1001
;* Map alien control state B to shape and draw it.
;* Draw 2x1 screen objects (alien).
;*****************************************************************************
L0788:
                       EX      DE,HL               ;
                       INC     HL                  ;
                       INC     HL                  ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
                       LD      A,(BC)              ; get alien control state B
                       LD      L,A                 ; as offset for...
                       LD      H,T1420 >> 8        ; get alien character block shapes table
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw alien character left part
                       INC     HL                  ; next character
                       CALL    RightOneColumn      ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw alien character right part
                       DEC     BC                  ;
                       RET                         ;

                       .ORG $079E
;*****************************************************************************
;* Bit4 control function 9E:
;* If control state A: 0111_xxxx
;* Delete 1x2 screen objects (alien).
;*****************************************************************************
L079E:
                       EX      DE,HL               ;
                       LD      D,(HL)              ; get MSB of screen ram
                       INC     HL                  ;
                       LD      E,(HL)              ; get LSB of screen ram
                       DEC     HL                  ; restore pointer
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete at screen, upper part
                       INC     DE                  ;
                       LD      (DE),A              ; delete at screen, lower part
                       EX      DE,HL               ;
                       RET                         ;

                       .ORG $07AA
;*****************************************************************************
;* Bit3 control function AA:
;* If control state A: xxxx_1011
;* Draw 1x2 screen objects (alien).
;*****************************************************************************
L07AA:
                       EX      DE,HL               ;
                       INC     HL                  ;
                       INC     HL                  ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
                       LD      A,(BC)              ;
                       LD      L,A                 ;
                       LD      H,T1420 >> 8        ; get alien character block shapes table
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw upper part on screen
                       INC     HL                  ;
                       INC     DE                  ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw lower part on screen
                       DEC     BC                  ;
                       RET                         ;

                       .ORG $07BE
;*****************************************************************************
;* Bit4 control function BE:
;* If control state A: 1001_xxxx
;* Delete 2x2 screen objects (player ship, alien).
;*****************************************************************************
L07BE:
                       EX      DE,HL               ;
                       LD      D,(HL)              ;
                       INC     HL                  ;
                       LD      E,(HL)              ;
                       DEC     HL                  ;
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete upper left part
                       INC     DE                  ;
                       LD      (DE),A              ; delete upper right part
                       CALL    RightOneColumn      ;
                       XOR     A                   ; A=0
                       LD      (DE),A              ; delete lower left part
                       DEC     DE                  ;
                       LD      (DE),A              ; delete lower right part
                       EX      DE,HL               ;
                       RET                         ;

                       .ORG $07D2
;*****************************************************************************
;* Bit3 control function D2:
;* If control state A: xxxx_1100
;* Draw 2x2 screen objects (player ship, alien, planets).
;*****************************************************************************
L07D2:
                       EX      DE,HL               ;
                       INC     HL                  ;
                       INC     HL                  ;
                       LD      D,(HL)              ; get MSB from player data structure (screen ram)
                       INC     HL                  ;
                       LD      E,(HL)              ; get LSB from player data structure (screen ram)
                       LD      A,(BC)              ; get value from player data structure (grid)
                       LD      L,A                 ;
                       LD      H,T1400 >> 8        ; get player ship character block shapes table
L07DC:
                       LD      A,(HL)              ; Entry point for general draw
                       LD      (DE),A              ; draw upper left part
                       INC     HL                  ;
                       INC     DE                  ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw upper right part
                       INC     HL                  ;
                       DEC     DE                  ;
                       CALL    RightOneColumn      ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw lower left part
                       INC     HL                  ;
                       INC     DE                  ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ; draw lower right part
                       DEC     BC                  ;
                       RET                         ;

                       .ORG $07F0
L07F0:
                       LD      A,(CounterB9)       ;
                       LD      (scrollRegister),A  ; 58xx scroll register
                       CALL    ClearForeground     ;
                       JP      SetBitsVideoRegister

                       .ORG $0800
;*****************************************************************************
;* Game state 3.
;* Normal game play.
;*****************************************************************************
L0800:
                       LD      HL,T0814            ;
                       LD      A,(LevelAndRound)   ; bit0 - 3: game level, bit4 - 7: game round
                       RLCA                        ; Multiply by 2 to get a 2 byte offset
                       AND     $1E                 ; mask out 0001_1110 game level
                       ADD     A,L                 ; add offset ...
                       LD      L,A                 ; ... to base of table
                       LD      A,(HL)              ; MSB of destination
                       INC     L                   ; Get the
                       LD      L,(HL)              ; ... LSB of destination
                       LD      H,A                 ; Now point to function
                       JP      (HL)                ; jump to corresponding function according to LevelAndRound.

                       .ORG $0814
T0814:
                       .MSFIRST
                       .DW L0834       ;Game level 0: called for each frame during stars scrolling down and 'aliens fade in'
                       .DW L2000       ;Game level 1: called for each frame during 'player alife' with aliens, after 'fade in'
                       .DW L0834       ;Game level 2: called for each frame during stars scrolling down and 'aliens fade in'
                       .DW L2000       ;Game level 3: called for each frame during 'player alife' with aliens, after 'fade in'
                       .DW L2230       ;Game level 4: called for each frame during 'spiral fill'
                       .DW L3400       ;Game level 5: called for each frame during birds level including 'fade in'
                       .DW L2230       ;Game level 6: called for each frame during 'spiral fill'
                       .DW L3400       ;Game level 7: called for each frame during birds level including 'fade in'
                       .DW L2230       ;Game level 8: called for each frame during 'spiral fill'
                       .DW L22B4       ;Game level 9: called for each frame during mothership 'fade in'
                       .DW L22CA       ;Game level A: called for each frame during mothership and aliens 'fade in'
                       .DW L2000       ;Game level B: called for each frame during 'player alife' with aliens and mothership, after 'fade in'

                       .ORG $0834
;*****************************************************************************
;* Game level 0 and 2:
;* Stars scrolling down and 'aliens fade in'
;*****************************************************************************
L0834:
                       CALL    L06F0               ; update scroll register and fill background
                       LD      HL,CounterB4        ; 
                       DEC     (HL)                ; decrement the counter
                       LD      A,(HL)              ;
                       CP      $15                 ;
                       RET     NC                  ;
                       CALL    GetAnimationChrs    ; for 'aliens fade in'
                       CALL    L05FA               ; init all alien control states
                       CALL    AlienDataController ;
L0848:
                       LD      HL,CounterB4        ;
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       RET     NZ                  ; if CounterB4 is 0.
                       LD      L,$B8               ;
                       INC     (HL)                ; increment game level $43B8
                       LD      L,$A4               ; Next interval game state ...
                       LD      (HL),$02            ; .. is 2
                       RET                         ;

                       .ORG $085A
;*****************************************************************************
;* The 'aliens fade in' animation sequence is:
;* 6C, 6D, 6E, 6F, 68, from foreground tiles.
;*****************************************************************************
GetAnimationChrs:
                       LD      DE,$086C            ;
                       CP      $11                 ;
                       RET     NC                  ;
                       LD      E,$6D               ;
                       CP      $0D                 ;
                       RET     NC                  ;
                       LD      E,$6E               ;
                       CP      $09                 ;
                       RET     NC                  ;
                       LD      E,$6F               ;
                       CP      $05                 ;
                       RET     NC                  ;
                       LD      E,$68               ;
                       RET                         ;

                       .ORG $0876
;*****************************************************************************
; Updates the player ship, player bullet and the shield.
;*****************************************************************************
PlayerUpdate:
                       CALL    PlayerDataController
                       CALL    L0886               ; copy current player data to old player data ?
                       CALL    L08A0               ; update player position, bullet and shield
                       CALL    L09A0               ; get screen ram adress for player ship position
                       CALL    L097A               ; map player ship position to $439E $439F
                       RET                         ;

;*****************************************************************************
; Copy current player data to old player data.
;*****************************************************************************
L0886:
                       LD      HL,M43EB            ;
                       LD      B,$03               ;
L088B:
                       LD      D,(HL)              ;
                       DEC     HL                  ;
                       LD      E,(HL)              ;
                       DEC     HL                  ;
                       LD      (HL),D              ;
                       DEC     HL                  ;
                       LD      (HL),E              ;
                       DEC     HL                  ;
                       DEC     B                   ;
                       JP      NZ,L088B            ;
                       RET                         ;

                       .ORG $08A0
L08A0:
                       CALL    MovePlayer          ;
                       LD      HL,PlayerBulletState
                       CALL    L0930               ; get the assigned player bullet tile if fire button was pressed
                       LD      A,(LevelAndRound)   ;
                       AND     $0F                 ; 0000_1111
                       CP      $03                 ;
                       RET     NZ                  ; return if not game level 3 (2nd alien wave)
                       LD      HL,AbovePlayerBulletState
                       CALL    L0930               ; get the assigned player bullet tile if fire button was pressed
                       RET                         ;

                       .ORG $08C4
;*****************************************************************************
;* Player ship, shield and bullets handler.
;*****************************************************************************
MovePlayer:
                       LD      HL,PlayerState      ;
                       LD      A,(HL)              ;
                       AND     $08                 ; mask out 0000_1000
                       JP      Z,DrawShields       ; Draw shields
                       LD      L,$A6               ;
                       LD      A,(HL)              ; get ShieldCount
                       AND     A                   ; updates the zero flag
                       JP      NZ,L08EA            ; if ShieldCount not 0.
                       LD      B,$80               ; 1000_0000 (bit7='shield')
                       CALL    CheckInputBits      ;
                       JP      Z,L08EB             ;
                       LD      L,$62               ;
                       LD      (HL),$40            ; set bit6 at $4362
                       LD      L,$C0               ;
                       LD      A,(HL)              ; get $43C0 PlayerState
                       AND     $F7                 ; mask out 1111_0111
                       LD      (HL),A              ;
                       LD      L,$A6               ;
                       LD      (HL),$FF            ;
L08EA:
                       DEC     (HL)                ; decrement ShieldCount
L08EB:
                       LD      L,PlayerShipX & $FF ; LSB of $43C2 PlayerShipX
                       CALL    L0900               ; Update the player ship x coordinate.
                       LD      BC,T1600            ;
                       JP      L0926               ; get player ship animation frame values, mapped with T1600/T1620

                       .ORG $0900
;*****************************************************************************
;* Update the player ship x coordinate.
;*****************************************************************************
L0900:
                       LD      A,(IN0Current)      ;
                       CPL                         ; flip the current bits
                       AND     $60                 ; mask out 0110_0000
                       RET     Z                   ; if no button pressed
                       AND     $40                 ; mask out 0100_0000
                       JP      Z,L0917             ;
                       LD      A,(HL)              ; get $43C2 PlayerShipX
                       CP      $0D                 ;
                       RET     C                   ; if left boundary reached
                       DEC     (HL)                ; 'left' button: dec $43C2 PlayerShipX
                       LD      A,$FF               ;
                       LD      (PlayerMoved),A     ; set 'player moved' flag
                       RET                         ;
L0917:
                       LD      A,(HL)              ; get $43C2 PlayerShipX
                       CP      $C0                 ;
                       RET     NC                  ; if right boundary reached
                       INC     (HL)                ; 'right' button: inc $43C2 PlayerShipX
                       LD      A,$FF               ;
                       LD      (PlayerMoved),A     ; set 'player moved' flag
                       RET                         ;

                       .ORG $0926
;*****************************************************************************
;* Get player ship animation frame values, mapped with T1600/T1620.
;*****************************************************************************
L0926:
                       LD      A,(HL)              ;
                       AND     $07                 ; mask out 0000_0111
                       ADD     A,C                 ;
                       LD      C,A                 ;
                       LD      A,(BC)              ; get data from table
                       DEC     L                   ;
                       LD      (HL),A              ;
                       RET                         ;

                       .ORG $0930
;*****************************************************************************
;* Get the assigned player bullet tile if fire button was pressed.
;*****************************************************************************
L0930:
                       LD      A,(HL)              ;
                       AND     $08                 ; mask out 0000_1000
                       JP      NZ,L0964            ; update PlayerBulletY (grid) and PlayerBulletState
                       EX      DE,HL               ;
                       LD      B,$10               ; 0001_0000 (bit4='fire')
                       CALL    CheckInputBits      ;
                       RET     Z                   ; return if button not pressed
                       LD      A,(HL)              ;
                       AND     $EF                 ; mask out 1110_1111
                       LD      (HL),A              ;
                       LD      A,(DE)              ;
                       OR      $08                 ; set bit3 at..
                       LD      (DE),A              ; $43C4 PlayerBulletState
                       INC     DE                  ;
                       INC     DE                  ;
                       LD      A,(PlayerShipX)     ;
                       ADD     $04                 ; mask out 0000_0100
                       LD      (DE),A              ;
                       INC     DE                  ;
                       LD      A,(PlayerShipY)     ; $D8
                       SUB     $08                 ;
                       LD      (DE),A              ;
                       DEC     DE                  ;
                       EX      DE,HL               ;
                       LD      BC,T1620            ; get character for player bullets
                       CALL    L0926               ; get player ship animation frame values, mapped with T1600/T1620
                       LD      A,$30               ; 0011_0000
                       LD      (BulletTriggered),A ; set 'bullet triggered' flag
                       RET                         ;

                       .ORG $0964
;*****************************************************************************
;* Update PlayerBulletY (grid) and PlayerBulletState.
;*****************************************************************************
L0964:
                       INC     L                   ;
                       INC     L                   ;
                       INC     L                   ;
                       LD      A,(HL)              ; get $43C7 PlayerBulletY (grid)
                       SUB     $08                 ; move bullet ($08 represents the bullet speed)
                       LD      (HL),A              ;
                       CP      $1F                 ; top of the screen reached?
                       RET     NC                  ; if not reached
L096E:
                       DEC     L                   ;
                       DEC     L                   ;
                       DEC     L                   ;
                       LD      A,(HL)              ; get $43C4 PlayerBulletState
                       AND     $F7                 ; 1111_0111
                       LD      (HL),A              ; del bit3 at PlayerBulletState
                       RET                         ;

                       .ORG $097A
;*****************************************************************************
;* Player ship X position mapping.
;*****************************************************************************
L097A:
                       LD      A,(PlayerShipX)     ;
                       LD      B,A                 ; save it
                       AND     $07                 ; mask out 0000_0111
                       RLCA                        ;
                       LD      HL,T0B38            ; mapping table
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      A,B                 ; restore it
                       SUB     (HL)                ;
                       LD      (M439E),A           ; Mapped player ship position, left part
                       INC     HL                  ;
                       LD      A,B                 ;
                       ADD     A,(HL)              ;
                       LD      (M439F),A           ; Mapped player ship position, right part
                       RET                         ;

                       .ORG $09A0
;*****************************************************************************
;* Get screen ram adress for player and bullet positions.
;* from: 43C2:43C3, 43C6:43C7, 43CA:43CB
;* ......PlayerShipX
;* ...........PlayerShipY
;* .................PlayerBulletX
;* ......................PlayerBulletY
;* ............................AbovePlayerBulletX
;* .................................AbovePlayerBulletY
;* to:   43E2:43E3, 43E6:43E7, 43EA:43EB
;*****************************************************************************
L09A0:
                       LD      BC,PlayerShipX      ;
                       LD      DE,PlayerShipMSB    ;
L09A6:
                       CALL    GetScreenRamAddress ;
                       INC     BC                  ;
                       INC     BC                  ;
                       INC     BC                  ;
                       INC     DE                  ;
                       INC     DE                  ;
                       INC     DE                  ;
                       LD      A,C                 ;
                       CP      $CE                 ; end of data structure
                       JP      NZ,L09A6            ;
                       RET                         ;

                       .ORG $09BA
;*****************************************************************************
;* Mapping of 'grid values' to screen ram address.
;*****************************************************************************
GetScreenRamAddress:
                       LD      HL,T0A00            ; Screen ram addresses for the top row (left to right)
                       LD      A,(BC)              ; get the coordinate
                       AND     $F8                 ; 1111_1000
                       RRCA                        ; 0111_1100
                       RRCA                        ; 0011_1110
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      A,(HL)              ; get MSB of screen ram address for row
                       LD      (DE),A              ; save it
                       INC     BC                  ;
                       INC     DE                  ;
                       INC     HL                  ; move to LSB for T0A00
                       LD      A,(BC)              ; get the coordinate
                       AND     $F8                 ; 1111_1000
                       RRCA                        ; 0111_1100
                       RRCA                        ; 0011_1110
                       RRCA                        ; 0001_1111
                       ADD     A,(HL)              ; add to LSB of screen ram address for row
                       LD      (DE),A              ; save it
                       RET                         ;

                       .ORG $0A00
; Screen ram addresses for the top row (left to right)
; Notice these addresses are MSB:LSB (backwards from the processors endianness)
T0A00:
                       .MSFIRST
                       .DW ForegroundScreen+$320  ; Upper left corner of rotated screen
                       .DW ForegroundScreen+$300
                       .DW ForegroundScreen+$2E0
                       .DW ForegroundScreen+$2C0
                       .DW ForegroundScreen+$2A0
                       .DW ForegroundScreen+$280
                       .DW ForegroundScreen+$260
                       .DW ForegroundScreen+$240
                       .DW ForegroundScreen+$220
                       .DW ForegroundScreen+$200
                       .DW ForegroundScreen+$1E0
                       .DW ForegroundScreen+$1C0
                       .DW ForegroundScreen+$1A0
                       .DW ForegroundScreen+$180
                       .DW ForegroundScreen+$160
                       .DW ForegroundScreen+$140
                       .DW ForegroundScreen+$120
                       .DW ForegroundScreen+$100
                       .DW ForegroundScreen+$E0
                       .DW ForegroundScreen+$C0
                       .DW ForegroundScreen+$A0
                       .DW ForegroundScreen+$80
                       .DW ForegroundScreen+$60
                       .DW ForegroundScreen+$40
                       .DW ForegroundScreen+$20
                       .DW ForegroundScreen       ; Upper right corner of rotated screen
; not used ?
                       .DB $00, $00
                       .DB $00, $00
                       .DB $00, $00
                       .DB $00, $00
                       .DB $00, $00
                       .DB $00, $00
;
T0A40:
                       .DB $AA, $BA, $AB, $BB     ;alien shape #37 (set A)
                       .DB $80, $90, $81, $91     ;alien shape #34 (set A)
T0A48:
                       .DB $74, $7C, $75, $7D     ;alien pilot shape (set B)

                       .ORG $0A50
;*****************************************************************************
;* Handle alien control states for all aliens.
;*****************************************************************************
AlienDataController:
                       LD      BC,M4B70            ; alien data structure (grid)
                       LD      DE,M4BB0            ; alien data structure (screen ram)
L0A56:
                       PUSH    BC                  ;
                       CALL    UpdateScreenObjects ;
                       POP     BC                  ;
                       LD      A,C                 ;
                       ADD     $04                 ;
                       LD      C,A                 ;
                       ADD     $40                 ;
                       LD      E,A                 ;
                       LD      D,B                 ;
                       AND     A                   ; updates the zero flag
                       JP      NZ,L0A56            ;
                       RET                         ;

                       .ORG $0A6C
;*****************************************************************************
;* Get screen ram adress for all aliens.
;*****************************************************************************
L0A6C:
                       LD      BC,M4B70            ; data structure for alien control and screen coordinate
                       LD      DE,M4BB3            ; data structure for alien screen ram address
L0A72:
                       PUSH    BC                  ;
                       PUSH    DE                  ;
                       LD      A,(BC)              ;
                       AND     $18                 ; mask out 0001_1000
                       JP      Z,L0A8A             ; if 0 then skip the mapping
                       EX      DE,HL               ;
                       LD      D,(HL)              ;
                       DEC     HL                  ;
                       LD      E,(HL)              ;
                       DEC     HL                  ;
                       LD      (HL),D              ;
                       DEC     HL                  ;
                       LD      (HL),E              ;
                       EX      DE,HL               ;
                       INC     DE                  ;
                       INC     DE                  ;
                       INC     BC                  ;
                       INC     BC                  ;
                       CALL    GetScreenRamAddress ;
L0A8A:
                       POP     DE                  ;
                       POP     BC                  ;
                       LD      A,C                 ;
                       ADD     $04                 ;
                       LD      C,A                 ;
                       LD      A,E                 ;
                       ADD     $04                 ;
                       LD      E,A                 ;
                       CP      $03                 ;
                       JP      NZ,L0A72            ;
                       RET                         ;

                       .ORG $0AA0
;*****************************************************************************
;* Handler for the player shield.
;*****************************************************************************
DrawShields:
                       LD      L,PlayerShipMSB & $FF     ; HL=43E2 Player's screen memory location
                       LD      D,(HL)              ; Get the PlayerScreenRamMSB
                       INC     HL                  ; Get the ... PlayerScreenRamLSB
                       LD      E,(HL)              ; ... LSB (ignore any fine bit shifting of the player)
                       CALL    LeftOneColumn       ; Shield pictures begin one column to the left of the ship
                       DEC     DE                  ; Shield pictures begin one row above the ship
                       LD      BC,$0404            ; Shiled images are 4x4
                       LD      L,ShieldCount & $FF ; Decrement the ...
                       DEC     (HL)                ; ... shield counter
                       LD      A,(HL)              ; Current shield counter value
                       LD      HL,FourByFourEmpty  ; Blank 4x4
                       CP      $C0                 ; Shield time done?
                       JP      Z,ShieldsExpired    ; Yes ... turn shields off
                       LD      HL,T1770            ; Four shield-active pictures
                       AND     $0C                 ; Drop lower 2 bits (0000_1100). Images change every 4 ticks.
                       RLCA                        ; Multiply by 4 ...
                       RLCA                        ; ... to get a 16-byte offest (4x4 pictures)
                       ADD     A,L                 ; Point to the ...
                       LD      L,A                 ; ... correct image
                       JP      DrawImageCbyB       ; Draw the new shield image

                       .ORG $0AD6
;*****************************************************************************
; B is number of rows
; C is number of columns
; HL is the data
; DE is the pointer to the screen
;*****************************************************************************
DrawImageCbyB:
                       PUSH    DE                  ; Hold screen pointer
                       PUSH    BC                  ; Hold width/Height
L0AD8:
                       LD      A,(HL)              ; Character to ...
                       LD      (DE),A              ; ... the screen
                       INC     HL                  ; Next in data
                       INC     DE                  ; Next column on screen
                       DEC     B                   ; All rows done in this column?
                       JP      NZ,L0AD8            ; No ... finish the rows
                       POP     BC                  ; Restore the counters
                       POP     DE                  ; Restore the screen pointer
                       CALL    RightOneColumn      ; Move over one column
                       DEC     C                   ; All columns done?
                       JP      NZ,DrawImageCbyB    ; No ... do all columns
                       RET                         ; Done

;*****************************************************************************
;* Game state 4.
;* Player ship partikel explosion.
;*****************************************************************************
L0AEA:
                       LD      HL,CounterB9        ;
                       LD      A,(HL)              
                       AND     $F8                 
                       LD      (HL),A              
                       LD      (scrollRegister),A  ; 58xx scroll register
                       LD      L,$E2               
                       LD      D,(HL)              
                       INC     L                   
                       LD      E,(HL)              
                       CALL    LeftOneColumn       ;
                       DEC     DE                  
                       NOP                         
                       LD      L,$A5               
                       DEC     (HL)                
                       LD      A,(HL)              
                       JP      Z,L0B15             ;
                       CP      $20                 
                       JP      C,L0BA0             ;
                       JP      Z,ClearForeground   ;
                       JP      L0BBA               ;

                       .ORG $0B15
L0B15:
                       DEC     L                   ;
                       LD      (HL),$05            
                       DEC     L                   
                       LD      A,(HL)              
                       ADD     $90                 
                       LD      L,A                 
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       DEC     (HL)                
                       PUSH    HL                  
                       CALL    UpdateLivesScreen   ;
                       POP     HL                  
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       LD      L,$A4               
                       LD      (HL),$00            
                       RET                         

                       .ORG $0B38
; Player ship X position mapping table
T0B38:
                       .DB $00, $08
                       .DB $01, $09
                       .DB $02, $0A
                       .DB $03, $0B
                       .DB $03, $0B
                       .DB $02, $0A
                       .DB $01, $09
                       .DB $00, $08
;
ShieldsExpired:
                       CALL    DrawImageCbyB       ;
                       LD      HL,PlayerState      ;
                       LD      (HL),$0C            
                       INC     L                   
                       LD      (HL),$0C            
                       INC     L                   
                       LD      A,(HL)              
                       AND     $F8                 
                       OR      $03                 
                       LD      (HL),A              
                       RET                         

                       .ORG $0B60
;*****************************************************************************
;* Game state 5.
;* 'GAME OVER'.
;*****************************************************************************
L0B60:
                       LD      HL,CounterA5        ;
                       INC     (HL)                
                       LD      A,(HL)              
                       CP      $40                 
                       JP      Z,ClearBackground   ;
                       LD      HL,T1A00            ; "        GAME  OVER        "
                       LD      C,$01               
                       CP      $80                 
                       JP      NZ,L0B95            ; 
                       LD      HL,GameState        ; Next interval game state ...
                       LD      (HL),$00            ; ... is 0 (new game start)
                       LD      L,$90               
                       LD      A,(HL)              
                       INC     L                   
                       OR      (HL)                
                       RET     NZ                  
                       XOR     A                   ; A=0
                       LD      L,$98               
                       LD      (HL),A              
                       INC     L                   
                       LD      (HL),A              
                       LD      L,$A2               
                       LD      (HL),A              
                       INC     L                   
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       LD      (HL),$00            
                       LD      BC,$0100            ; from bank 1 to bank 0
                       CALL    CopyMemoryBank      ;
                       RET                         
;
L0B95:
                       CALL    PrintTextLines      ;
                       CALL    L01E4               ; Print the copyright lines
                       JP      L1DF0               ;

                       .ORG $0BA0
;
L0BA0:
                       LD      HL,LevelAndRound    ;
                       LD      A,(HL)              ;
                       AND     $0F                 ; mask out 0000_1111
                       CP      $04                 ;
                       RET     C                   ; return if < game level 4 (alien waves)
                       CP      $09                 ;
                       RET     NC                  ; return if > game level 9 (mothership)
                       INC     L                   ; CounterB9
                       XOR     A                   ; A=0
                       LD      (HL),A              ; CounterB9 to 0
                       LD      (scrollRegister),A  ; reset the 58xx scroll register
                       JP      ClearBackground     ;

                       .ORG $0BBA
;
L0BBA:
                       LD      B,A                 ;
                       RRCA                        ;
                       JP      NC,L0FC0            ; Handle animations for killed aliens
                       RRCA                        ;
                       LD      A,B                 ;
                       JP      C,L2070             ;
                       JP      L20E8               ;

                       .ORG $0BCA
;*****************************************************************************
;* Draws the character tiles for the score average table.
;*****************************************************************************
DrawScoreAverageTableTiles:
                       LD      HL,$42D0            ; upper left corner screen ram position
                       LD      BC,$FFDF            ; Screen offset constant -33 right one column (-1), up one row (-32)
                       LD      (HL),$64            ; left part of alien shape #3
                       ADD     HL,BC               ;
                       INC     HL                  ;
                       LD      (HL),$65            ; right part of alien shape #3
                       LD      HL,$42F2            ; screen ram position for
                       LD      DE,T0A40            ; T0A40 alien shape #37 and alien shape #34
                       CALL    Draw4x2             ;
                       LD      HL,$4B15            ; screen ram position for
                       LD      DE,T3C00            ; bird shape #24 (Object 3C00)
                       CALL    Draw6x2             ;
                       LD      HL,$4AD8            ; screen ram position for
                       LD      DE,T0A48            ; T0A48 alien pilot shape
                       CALL    Draw2x2             ;
                       RET                         ;

                       .ORG $0C00
L0C00:
                       PUSH    HL                  
                       LD      A,L                 
                       SUB     $72                 
                       RRCA                        
                       ADD     $50                 
                       LD      L,A                 
                       LD      A,(HL)              
                       INC     L                   
                       LD      L,(HL)              
                       LD      H,A                 
                       LD      DE,$0C04            
                       LD      A,(HL)              
                       POP     HL                  
                       CP      $07                 
                       JP      C,L0EA4             ;
                       CP      $09                 
                       JP      NC,L0EA4            ;
                       LD      DE,$1020            ; set E reg. for bonus explosion score 200
                       LD      A,$FF               ; set bonus explosion flag
                       LD      (M4369),A           ;
                       JP      L0EA4               ;

                       .ORG $0C40
;
L0C40:
                       LD      HL,AlienBullet4LSB  ; 
                       LD      B,$05               
                       CALL    L088B               ; 
                       CALL    L0C56               ; 
                       CALL    L0C6B               ; 
                       CALL    L0CD8               ; 
                       RET                         

                       .ORG $0C56
L0C56:
                       LD      HL,AlienBullet0State; 
L0C59:
                       PUSH    HL                  
                       CALL    L0C84               ; 
                       POP     HL                  
                       LD      A,L                 
                       ADD     $04                 
                       LD      L,A                 
                       CP      $E0                 
                       JP      NZ,L0C59            ; 
                       RET                         

                       .ORG $0C6B
L0C6B:
                       LD      BC,AlienBullet0X    ; 
                       LD      DE,AlienBullet0MSB  ; 
L0C71:
                       CALL    GetScreenRamAddress ; 
                       INC     BC                  
                       INC     BC                  
                       INC     BC                  
                       INC     DE                  
                       INC     DE                  
                       INC     DE                  
                       LD      A,C                 
                       CP      $E2                 
                       JP      NZ,L0C71            ; 
                       RET                         

                       .ORG $0C84
L0C84:
                       LD      A,(HL)              
                       AND     $08                 
                       RET     Z                   
                       NOP                         
                       NOP                         
                       INC     L                   
                       LD      A,(HL)              
                       XOR     $04                 
                       LD      (HL),A              
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       ADD     $04                 
                       LD      (HL),A              
                       CP      $F9                 
                       JP      NC,L096E            ; 
                       DEC     L                   
                       CALL    L0CB4               ; 
                       LD      D,H                 
                       LD      A,L                 
                       ADD     $20                 
                       LD      E,A                 
                       EX      DE,HL               
                       LD      B,(HL)              
                       INC     HL                  
                       LD      C,(HL)              
                       LD      A,(BC)              
                       EX      DE,HL               
                       INC     L                   
                       CP      $E8                 
                       JP      NC,L096E            ; 
                       RET                         

                       .ORG $0CB4
;
L0CB4:
                       CP      $DC                 
                       RET     C                   
                       CP      $E9                 
                       RET     NC                  
                       LD      A,(M439F)           ; 
                       CP      (HL)                
                       RET     C                   
                       LD      A,(M439E)           ; 
                       CP      (HL)                
                       RET     NC                  

;*****************************************************************************
;* The player ship was hit.
;* MAME cheat code "Invincibility": Set $0CC4 to $C9 (RET).
;*****************************************************************************
L0CC4:
                       LD      A,$04               ; Next interval game state is 4 (player ship partikel explosion)
                       LD      (GameState),A       ; 
                       LD      A,$60               ; set a new counter value for ...
                       LD      (CounterA5),A       ; 
                       LD      A,$10               ; set flag and counter for ..
                       LD      (ParticleExplosion),A
                       RET                         ;

                       .ORG $0CD8
;
L0CD8:
                       LD      BC,AlienBullet0State; data structure (grid)
                       LD      DE,OldAlienBullet0MSB; screen ram
L0CDE:
                       PUSH    BC                  
                       CALL    UpdateScreenObjects ; 
                       POP     BC                  
                       LD      A,C                 
                       ADD     $04                 
                       LD      C,A                 
                       ADD     $20                 
                       LD      E,A                 
                       LD      D,B                 
                       AND     A                   ; updates the zero flag
                       JP      NZ,L0CDE            ; 
                       RET                         

                       .ORG $0CF4
; Alien collision on left or right side of player ship.
L0CF4:
                       POP     DE                  
                       POP     BC                  
                       RET                         

                       .ORG $0D1C
L0D1C:
                       LD      BC,M4B70            ; 
                       LD      HL,M4B50            ; 
L0D22:
                       CALL    L0D30               ; 
                       INC     C                   
                       INC     C                   
                       INC     L                   
                       LD      A,$B0               
                       CP      C                   
                       JP      NZ,L0D22            ; 
                       RET                         

                       .ORG $0D30
;
L0D30:
                       LD      D,(HL)              
                       INC     HL                  
                       LD      A,(BC)              
                       INC     BC                  
                       INC     BC                  
                       AND     $08                 
                       RET     Z                   ; if bit3 of alien control state A, not set
                       LD      E,(HL)              
                       EX      DE,HL               
                       LD      A,(HL)              ; get T1000 (Closed loops pattern table for aliens)
                       RLCA                        ; Multiply by 2
                       ADD     $00                 ; reset all flags
                       LD      L,A                 
                       LD      H,T1700 >> 8        ; get MSB for T1700
                       XOR     A                   ; A=0
                       CP      (HL)                
                       JP      Z,L0D4F             ; 
                       INC     HL                  
                       CP      (HL)                
                       JP      Z,L0D5E             ; 
                       DEC     HL                  
                       LD      A,(BC)              
                       ADD     A,(HL)              
                       LD      (BC),A              
L0D4F:
                       INC     BC                  
                       INC     HL                  
                       LD      A,(BC)              
                       ADD     A,(HL)              
                       LD      (BC),A              
                       DEC     BC                  
                       AND     $07                 
                       EX      DE,HL               
                       RET     NZ                  
                       INC     (HL)                
                       RET                         

                       .ORG $0D5E
L0D5E:
                       DEC     HL                  
                       LD      A,(BC)              
                       ADD     A,(HL)              
                       LD      (BC),A              
                       AND     $07                 
                       EX      DE,HL               
                       RET     NZ                  
                       INC     (HL)                
                       RET                         

                       .ORG $0D70
;
L0D70:
                       LD      BC,M4B70            ; 
                       LD      HL,M4B50            ; 
L0D76:
                       CALL    L0D86               ; 
                       LD      A,C                 
                       ADD     $04                 
                       LD      C,A                 
                       LD      A,$B0               
                       CP      C                   
                       JP      NZ,L0D76            ; 
                       RET                         

                       .ORG $0D86
L0D86:
                       LD      D,(HL)              
                       INC     HL                  
                       LD      E,(HL)              
                       INC     HL                  
                       LD      A,(BC)              
                       AND     $08                 
                       RET     Z                   
                       EX      DE,HL               
                       LD      A,(HL)              ; Closed loops pattern table for aliens
                       AND     A                   ; updates the zero flag
                       CALL    Z,L0DDE             ; 
                       LD      L,A                 
                       RLCA                        ; Multiply by 2
                       ADD     A,L                 
                       ADD     $A0                 
                       LD      L,A                 
                       LD      H,T1600 >> 8        
                       LD      A,(BC)              
                       AND     $F8                 
                       OR      (HL)                
                       LD      (BC),A              
                       INC     BC                  
                       INC     BC                  
                       INC     BC                  
                       INC     HL                  
                       LD      A,(HL)              
                       INC     HL                  
                       RRCA                        
                       JP      C,L0DBB             ; 
                       RRCA                        
                       JP      C,L0DCC             ; 
                       LD      A,(BC)              
                       RRCA                        
                       AND     $03                 
                       ADD     A,(HL)              
                       DEC     BC                  
                       JP      L0DD2               ; 

                       .ORG $0DBB
;
L0DBB:
                       LD      A,(BC)              
                       RRCA                        
                       AND     $03                 
                       ADD     A,(HL)              
                       LD      H,A                 
                       DEC     BC                  
                       LD      A,(BC)              
                       AND     $04                 
                       ADD     A,H                 
                       JP      L0DD2               ; 

                       .ORG $0DCC
;
L0DCC:
                       DEC     BC                  
                       LD      A,(BC)              
                       RRCA                        
                       AND     $03                 
                       ADD     A,(HL)              
L0DD2:
                       LD      L,A                 
                       LD      H,T1600 >> 8       ; get data from T1600
                       LD      A,(HL)              
                       DEC     BC                  
                       LD      (BC),A              
                       DEC     BC                  
                       EX      DE,HL               
                       RET                         

                       .ORG $0DDE
;
L0DDE:
                       DEC     DE                  
                       DEC     DE                  
                       LD      A,(M4394)           ; 
                       LD      (DE),A              
                       LD      H,A                 
                       INC     DE                  
                       LD      A,(M4395)           ; 
                       LD      (DE),A              
                       LD      L,A                 
                       INC     DE                  
                       LD      A,(HL)              
                       RET                         

                       .ORG $0DF0
;*****************************************************************************
;* Alien bullet to player ship, collission detection.
;*****************************************************************************
L0DF0:
                       LD      BC,PlayerBulletState; 
                       LD      HL,AbovePlayerBulletMSB; MSB screen ram: One character above player bullet
                       CALL    L0E10               ; 
                       LD      BC,AbovePlayerBulletState; 
                       LD      HL,M43EA            ; MSB screen ram: Left screen edge, one character above player ship
                       JP      L0E10               ; 

                       .ORG $0E10
;
L0E10:
                       LD      A,(BC)              ; ?
                       AND     $08                 ; mask out 0000_1000
                       RET     Z                   ; if bit3 not set
                       LD      D,(HL)              ; get MSB screen ram adress
                       INC     L                   ;
                       LD      E,(HL)              ; get LSB screen ram adress
                       LD      A,(DE)              ; get character
                       CP      $C0                 ; bullets and alien ($50 - $BF)
                       RET     NC                  ;
                       CP      $60                 ; alien ($60 - $BF)
                       RET     C                   ; if no character
                       CP      $68                 ; alien
                       JP      NC,L0E39            ; 
                       AND     $07                 ; mask out 0000_0111
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       ADD     $40                 ;
                       LD      L,A                 ;
                       LD      H,T1740 >> 8        ; T1740
                       INC     BC                  ;
                       INC     BC                  ;
                       LD      A,(BC)              ;
                       AND     $07                 ;
                       CP      (HL)                ;
                       RET     NC                  ;
                       INC     HL                  ;
                       CP      (HL)                ;
                       RET     C                   ;
                       JP      L0E70               ; 

;
L0E39:
                       INC     BC                  
                       INC     BC                  
                       LD      A,(BC)              
                       LD      D,A                 
                       INC     BC                  
                       LD      A,(BC)              
                       AND     $F8                 
                       LD      E,A                 
                       LD      HL,M4B70            ; 
L0E45:
                       LD      A,(HL)              
                       INC     HL                  
                       INC     HL                  
                       AND     $08                 
                       CALL    NZ,L0E58            ; 
                       INC     HL                  
                       INC     HL                  
                       LD      A,$B0               
                       CP      L                   
                       JP      NZ,L0E45            ; 
                       RET                         

                       .ORG $0E58
;
L0E58:
                       LD      A,D                 
                       CP      (HL)                
                       RET     C                   
                       LD      A,(HL)              
                       ADD     $08                 
                       CP      D                   
                       RET     C                   
                       INC     HL                  
                       LD      A,(HL)              
                       DEC     HL                  
                       ADD     $04                 
                       CP      E                   
                       RET     C                   
                       SUB     $0C                 
                       CP      E                   
                       RET     NC                  
                       JP      L0C00               ; 

                       .ORG $0E70
;
L0E70:
                       INC     HL                  
                       LD      A,(BC)              
                       AND     $F8                 
                       ADD     A,(HL)              
                       LD      D,A                 
                       INC     BC                  
                       LD      A,(BC)              
                       AND     $F8                 
                       LD      E,A                 
                       LD      HL,M4B70            ; 
L0E7E:
                       LD      A,(HL)              
                       INC     HL                  
                       INC     HL                  
                       AND     $08                 
                       CALL    NZ,L0E90            ; 
                       INC     HL                  
                       INC     HL                  
                       LD      A,$B0               
                       CP      L                   
                       JP      NZ,L0E7E            ; 
                       RET                         

                       .ORG $0E90
;
L0E90:
                       LD      A,(HL)              
                       ADD     $02                 
                       CP      D                   
                       RET     C                   
                       SUB     $05                 
                       CP      D                   
                       RET     NC                  
                       INC     HL                  
                       LD      A,(HL)              
                       DEC     HL                  
                       AND     $F8                 
                       CP      E                   
                       RET     NZ                  
                       LD      DE,$0C02            ; E reg. set to: 'bonus explosion score 020'.
                       NOP                         
;
L0EA4:
                       DEC     HL                  
                       DEC     HL                  
                       DEC     BC                  
                       DEC     BC                  
                       DEC     BC                  
                       LD      A,(BC)              
                       AND     $F7                 
                       LD      (BC),A              
L0EAD:
                       LD      A,(HL)              
                       AND     $F7                 
                       LD      (HL),A              
                       LD      A,L                 
                       ADD     $42                 
                       LD      L,A                 
                       LD      B,(HL)              
                       INC     HL                  
                       LD      C,(HL)              
                       LD      HL,M4378            ; 
                       LD      A,D                 
                       CP      $10                 
                       JP      Z,L0EC3             ; 
                       LD      L,$70               
L0EC3:
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       JP      Z,L0ED5             ; 
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       JP      Z,L0ED5             ; 
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     L                   
L0ED5:
                       LD      (HL),D              
                       INC     L                   
                       LD      (HL),E              ; set $4379 (bonus explosion score)
                       INC     L                   
                       LD      (HL),B              
                       INC     L                   
                       LD      (HL),C              
                       LD      L,$64               
                       LD      (HL),$FF            
                       LD      L,$BA               
                       DEC     (HL)                ; decrement AliensLeft
                       POP     HL                  
                       POP     HL                  
                       JP      (HL)                

                       .ORG $0F00
;*****************************************************************************
;* 'Alien with player' collision check.
;* MAME cheat code "Invisibility for aliens": Set $0F00 to $C9 (RET)
;*****************************************************************************
L0F00:
                       LD      HL,ShieldCount      ; 
                       LD      A,(HL)              ;
                       CP      $C0                 ;
                       JP      NC,L0F74            ; 
                       LD      L,$E2               ;
                       LD      D,(HL)              ; get $43E2 PlayerShipMSB
                       INC     L                   ;
                       LD      E,(HL)              ; get $43E3 PlayerShipLSB
                       LD      BC,$0202            
                       CALL    L0F56               ; 'alien with player' collision check
                       RET     Z                   ; if no collision
                       NOP                         
                       NOP                         
                       LD      HL,M439E            ; Mapped player ship position, left part: ($09 to $C0)
                       LD      A,(HL)              
                       SUB     $06                 
                       LD      B,A                 
                       INC     L                   
                       LD      C,(HL)              
                       LD      HL,M4B70            ; 
L0F23:
                       LD      A,(HL)              
                       INC     L                   
                       INC     L                   
                       AND     $08                 
                       CALL    NZ,L0F38            ; 
                       INC     L                   
                       INC     L                   
                       LD      A,$B0               
                       CP      L                   
                       JP      NZ,L0F23            ; 
                       RET                         

                       .ORG $0F38
;
L0F38:
                       INC     L                   
                       LD      A,(HL)              
                       DEC     L                   
                       CP      $D2                 
                       RET     C                   
                       CP      $E7                 
                       RET     NC                  
                       LD      A,(HL)              
                       CP      C                   
                       RET     NC                  
                       CP      B                   
                       RET     C                   
                       CALL    L0CC4               ; 
                       LD      DE,$0D04            
                       DEC     HL                  
                       DEC     HL                  
                       JP      L0EAD               ; 

                       .ORG $0F56
; 'alien with player' collision check.
; All parts of the player ship object are checked for a collision with aliens.
L0F56:
                       PUSH    BC                  ;
                       PUSH    DE                  ;
L0F58:
                       LD      A,(DE)              ; get upper left character of player ship
                       CP      $60                 ; alien characters ($60 to $BF)
                       JP      C,L0F63             ; if no collision on left side
                       CP      $C0                 ;
                       JP      C,L0CF4             ; if collision on left or right side
L0F63:
                       INC     DE                  ; get upper right character of player ship
                       DEC     B                   ;
                       JP      NZ,L0F58            ; 
                       POP     DE                  ;
                       POP     BC                  ;
                       CALL    RightOneColumn      ; for lower part of player ship
                       DEC     C                   ;
                       JP      NZ,L0F56            ; 
                       RET                         ;

                       .ORG $0F74
;
L0F74:
                       LD      L,$E2               
                       LD      D,(HL)              
                       INC     L                   
                       LD      E,(HL)              
                       CALL    RightOneColumn      ; 
                       DEC     DE                  
                       LD      BC,$0404            
                       CALL    L0F56               ; 
                       RET     Z                   
                       NOP                         
                       NOP                         
                       LD      A,(PlayerShipX)     ; 
                       SUB     $0E                 
                       LD      B,A                 
                       ADD     $2D                 
                       LD      C,A                 
                       LD      HL,M4B70            ; 
L0F92:
                       LD      A,(HL)              
                       INC     L                   
                       INC     L                   
                       AND     $08                 
                       CALL    NZ,L0FA6            ; 
                       INC     L                   
                       INC     L                   
                       LD      A,$B0               
                       CP      L                   
                       JP      NZ,L0F92            ; 
                       RET                         

                       .ORG $0FA6
;
L0FA6:
                       INC     L                   
                       LD      A,(HL)              
                       DEC     L                   
                       CP      $CA                 
                       RET     C                   
                       CP      $EF                 
                       RET     NC                  
                       LD      A,(HL)              
                       CP      C                   
                       RET     NC                  
                       CP      B                   
                       RET     C                   
                       LD      DE,$0D02            
                       DEC     HL                  
                       DEC     HL                  
                       JP      L0EAD               ; 

                       .ORG $0FC0
;*****************************************************************************
;* Handle animations for killed aliens
;*****************************************************************************
L0FC0:
                       LD      HL,M4370            ; 
                       CALL    L0FD8               ; 
                       LD      HL,M4374            ; 
                       CALL    L0FD8               ; 
                       LD      HL,M4378            ; 
                       CALL    L3758               ; 
                       LD      HL,M437C            ; 
                       JP      L3758               ; 
;
L0FD8:
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       LD      B,(HL)              
                       DEC     (HL)                
                       INC     L                   
                       INC     L                   
                       LD      D,(HL)              
                       INC     L                   
                       LD      E,(HL)              
                       NOP                         
                       CALL    LeftOneColumn       ; 
                       LD      A,B                 
                       AND     $0E                 
                       RRCA                        
                       ADD     $B0                 
                       LD      L,A                 
                       LD      H,$17               
                       LD      L,(HL)              
                       EX      DE,HL               
                       LD      BC,$FFDF            ; Screen offset constant -33 right one column (-1), up one row (-32)
                       JP      Draw3x2             ; 

                       .ORG $1000
;?
T1000:
                       .DB $01, $01, $01, $01, $02, $02, $02, $02
                       .DB $02, $02, $02, $02, $01, $01, $01, $01
                       .DB $00
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF
; Closed loops pattern table for aliens
; Pattern 1
T1020:
                       .DB $10, $11, $12, $13, $10, $1D, $0D, $0E
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $06, $06
                       .DB $1E, $03, $1F, $05, $1C, $04, $1D, $06
                       .DB $1E, $03, $03, $03, $03, $03, $1F, $1C
                       .DB $1D, $1E, $03, $03, $03, $03, $03, $1F
                       .DB $05, $1C, $04, $1D, $06, $1E, $03, $1F
                       .DB $05, $05, $05, $05, $05, $05, $05, $05
                       .DB $05, $05, $1C, $04, $04, $11, $12, $13
                       .DB $00, $FF, $FF, $FF
; Pattern 2
T1064:
                       .DB $0B, $1E, $19, $06, $06, $06, $06, $06
                       .DB $06, $1E, $1F, $1C, $1D, $06, $06, $06
                       .DB $06, $06, $1E, $03, $1F, $05, $1C, $04
                       .DB $1D, $06, $06, $1A, $04, $1B, $05, $18
                       .DB $19, $06, $1A, $04, $1B, $05, $05, $1C
                       .DB $04, $1D, $06, $1E, $03, $1F, $05, $05
                       .DB $05, $05, $05, $1C, $1D, $1E, $1F, $05
                       .DB $05, $05, $05, $05, $05, $05, $18, $1F
                       .DB $00, $FF, $FF, $FF
; Pattern 3
T10A8:
                       .DB $10, $04, $04, $1D, $0D, $0E, $0B, $0C
                       .DB $0D, $0E, $01, $01, $01, $01, $01, $01
                       .DB $01, $01, $05, $05, $05, $05, $05, $1C
                       .DB $04, $04, $1D, $06, $06, $1E, $03, $03
                       .DB $1F, $05, $05, $05, $1C, $11, $12, $13
                       .DB $00, $FF, $FF, $FF
; Pattern 4
T10D4:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0D, $0E
                       .DB $0B, $0C, $1A, $1B, $05, $18, $19, $06
                       .DB $0D, $0E, $01, $01, $01, $01, $01, $01
                       .DB $01, $01, $05, $05, $1C, $1B, $05, $05
                       .DB $1C, $04, $1B, $05, $05, $1C, $04, $1B
                       .DB $00, $FF, $FF, $FF
; Pattern 5
T1100:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $09, $09
                       .DB $09, $09, $0A, $0A, $09, $09, $0A, $09
                       .DB $16, $17, $14, $07, $07, $07, $1C, $04
                       .DB $1D, $06, $1E, $03, $1F, $05, $1C, $08
                       .DB $08, $08, $08, $08, $08, $08, $08, $05
                       .DB $05, $05, $05, $00, $FF, $FF, $FF, $FF
; Pattern 6
T1130:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0A, $0A
                       .DB $0A, $0A, $09, $09, $0A, $0A, $09, $0A
                       .DB $12, $13, $10, $08, $08, $08, $18, $07
                       .DB $07, $07, $07, $05, $1C, $04, $1D, $06
                       .DB $1E, $03, $1F, $07, $07, $07, $07, $05
                       .DB $05, $05, $05, $00, $FF, $FF, $FF, $FF
; Pattern 7
T1160:
                       .DB $1C, $04, $04, $04, $1D, $06, $0D, $0E
                       .DB $0B, $0C, $06, $06, $1E, $15, $16, $17
                       .DB $14, $19, $06, $1A, $04, $1D, $06, $1E
                       .DB $03, $19, $06, $1A, $04, $1D, $1E, $03
                       .DB $1F, $1C, $04, $1B, $05, $18, $03, $1F
                       .DB $05, $1C, $04, $1B, $05, $18, $03, $15
                       .DB $16, $17, $14, $1F, $05, $05, $05, $05
                       .DB $05, $05, $05, $1C, $04, $1D, $1A, $1B
                       .DB $00, $FF, $FF, $FF
; Pattern 8
T11A4:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0D, $0E
                       .DB $0B, $0C, $0D, $0E, $02, $02, $02, $02
                       .DB $02, $02, $02, $02, $05, $05, $18, $03
                       .DB $19, $1A, $04, $1B, $05, $18, $03, $1F
                       .DB $05, $18, $03, $1F, $05, $05, $18, $1F
                       .DB $00, $FF, $FF, $FF
; Pattern 9
T11D0:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $06, $06
                       .DB $09, $09, $09, $0A, $09, $09, $0A, $09
                       .DB $09, $09, $06, $1A, $04, $11, $12, $13
                       .DB $10, $08, $08, $08, $07, $07, $07, $08
                       .DB $08, $08, $05, $05, $05, $05, $05, $05
                       .DB $05, $05, $05, $05, $05, $00, $FF, $FF
; Pattern 10
T1200:
                       .DB $1C, $11, $12, $13, $10, $04, $1D, $0D
                       .DB $0E, $0B, $0C, $0D, $0E, $0B, $0C, $1E
                       .DB $1F, $05, $18, $19, $0D, $0E, $0B, $0C
                       .DB $1E, $1F, $05, $05, $05, $05, $05, $18
                       .DB $19, $0D, $0E, $0B, $0C, $06, $1E, $1F
                       .DB $05, $05, $05, $05, $18, $19, $06, $1E
                       .DB $1F, $05, $05, $05, $05, $05, $05, $05
                       .DB $05, $1C, $04, $04, $1D, $1A, $04, $1B
                       .DB $00, $FF, $FF, $FF
; Pattern 11
T1244:
                       .DB $18, $03, $03, $19, $06, $06, $06, $06
                       .DB $06, $06, $06, $06, $06, $06, $06, $06
                       .DB $1A, $04, $1B, $05, $1C, $04, $1D, $06
                       .DB $1E, $03, $03, $19, $06, $1A, $04, $04
                       .DB $04, $1B, $05, $18, $03, $03, $1F, $05
                       .DB $1C, $04, $1D, $06, $1A, $04, $1B, $05
                       .DB $05, $05, $05, $05, $05, $05, $05, $05
                       .DB $05, $05, $05, $18, $03, $19, $1E, $1F
                       .DB $00, $FF, $FF, $FF
; Pattern 12
T1288:
                       .DB $0B, $0C, $1A, $1D, $1E, $03, $19, $06
                       .DB $1A, $04, $04, $1D, $06, $1E, $03, $03
                       .DB $03, $19, $06, $06, $1A, $04, $04, $04
                       .DB $04, $1D, $06, $06, $1E, $03, $03, $03
                       .DB $03, $03, $03, $1F, $05, $05, $1C, $04
                       .DB $04, $04, $04, $1B, $05, $05, $18, $03
                       .DB $03, $03, $1F, $05, $1C, $04, $04, $1B
                       .DB $05, $18, $03, $1F, $1C, $1B, $05, $05
                       .DB $00, $FF,
; Pattern 13
T12CA:
                       .DB $18, $03, $19, $06, $06, $06, $06, $06
                       .DB $06, $1A, $1D, $1E, $19, $1A, $1D, $06
                       .DB $1E, $19, $06, $1E, $15, $16, $17, $14
                       .DB $07, $07, $07, $08, $08, $08, $08, $05
                       .DB $05, $18, $03, $03, $19, $06, $06, $1A
                       .DB $04, $04, $1B, $08, $08, $08, $08, $05
                       .DB $05, $05, $05, $18, $1F, $00
; Pattern 14
T1300:
                       .DB $0B, $0C, $0A, $0A, $09, $09, $09, $0A
                       .DB $0A, $09, $09, $09, $0A, $09, $09, $16
                       .DB $17, $14, $07, $07, $07, $08, $08, $08
                       .DB $08, $07, $07, $08, $08, $08, $08, $07
                       .DB $08, $11, $12, $13, $00, $FF, $FF, $FF
; Pattern 15
T1328:
                       .DB $0B, $0C, $09, $09, $0A, $09, $09, $0A
                       .DB $0A, $0A, $0A, $09, $0A, $0A, $0A, $12
                       .DB $13, $10, $04, $04, $04, $1B, $18, $03
                       .DB $03, $07, $07, $08, $08, $07, $07, $08
                       .DB $08, $07, $07, $07, $07, $07, $00, $FF
                       .DB $FF, $FF, $FF, $FF
; Pattern 16
T1354:
                       .DB $1C, $11, $12, $13, $10, $1D, $0D, $0E
                       .DB $0B, $0C, $09, $0A, $09, $09, $0A, $09
                       .DB $09, $09, $06, $1A, $04, $1B, $05, $18
                       .DB $03, $19, $09, $09, $0D, $0E, $0B, $0C
                       .DB $0D, $0E, $02, $02, $02, $02, $02, $02
                       .DB $02, $02, $02, $02, $02, $02, $08, $07
                       .DB $07, $08, $07, $07, $08, $08, $07, $07
                       .DB $07, $07, $07, $05, $05, $05, $05, $05
                       .DB $05, $1C, $11, $12, $13, $00, $FF, $FF
; Pattern 17
T139C:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0D, $0E
                       .DB $0B, $0C, $1A, $1D, $06, $1E, $19, $06
                       .DB $06, $1A, $04, $1B, $1C, $04, $1D, $1A
                       .DB $04, $1B, $1C, $04, $1D, $1A, $04, $1B
                       .DB $05, $18, $07, $07, $07, $08, $08, $07
                       .DB $07, $07, $07, $08, $08, $07, $07, $07
                       .DB $07, $00, $FF, $FF
; Pattern 18
T13D0:
                       .DB $14, $03, $19, $0D, $0E, $0B, $0C, $0A
                       .DB $0A, $0A, $09, $0A, $0A, $0A, $09, $0A
                       .DB $0A, $0A, $06, $1E, $15, $16, $17, $14
                       .DB $03, $1F, $05, $05, $08, $07, $07, $07
                       .DB $08, $07, $07, $07, $08, $08, $05, $05
                       .DB $05, $05, $05, $00, $FF, $FF, $FF, $FF
; Player ship character block shapes table
; used for fine bit shifting of the player
T1400:
                       .DB $30, $40, $31, $41     ;position 1
                       .DB $32, $42, $33, $43     ;position 2
                       .DB $34, $44, $35, $45     ;position 3
                       .DB $36, $46, $37, $47     ;position 4
                       .DB $38, $48, $39, $49     ;position 5
                       .DB $3A, $4A, $3B, $4B     ;position 6
                       .DB $3C, $4C, $3D, $4D     ;position 7
                       .DB $3E, $4E, $3F, $4F     ;position 8

; Alien character block shapes table ($00=SPACE)
T1420:
                       .DB $60, $61           ;alien shape #1
                       .DB $62, $63           ;#2
                       .DB $64, $65           ;#3
                       .DB $66, $67           ;#4
                       .DB $69, $00           ;#6
                       .DB $69, $00           ;#6
                       .DB $7A, $7B           ;#28
                       .DB $7A, $7B           ;#28
                       .DB $6B, $00           ;#8
                       .DB $6B, $00           ;#8
                       .DB $8C, $8D           ;#29
                       .DB $8C, $8D           ;#29
                       .DB $68, $00           ;#5
                       .DB $68, $00           ;#5
                       .DB $8A, $9A           ;#30
                       .DB $8A, $9A           ;#30
                       .DB $6A, $00           ;#7
                       .DB $6A, $00           ;#7
                       .DB $8B, $9B           ;#31
                       .DB $8B, $9B           ;#31
                       .DB $68, $00           ;#5
                       .DB $6B, $00           ;#8
                       .DB $6A, $00           ;#7
                       .DB $69, $00           ;#6
                       .DB $76, $77           ;#18
                       .DB $74, $75           ;#19
                       .DB $72, $73           ;#16
                       .DB $70, $71           ;#17
                       .DB $68, $00           ;#5
                       .DB $86, $96           ;#22
                       .DB $69, $00           ;#6
                       .DB $87, $97           ;#21
                       .DB $6A, $00           ;#7
                       .DB $88, $98           ;#20
                       .DB $6B, $00           ;#8
                       .DB $89, $99           ;#23
                       .DB $68, $00           ;#5
                       .DB $00, $00
                       .DB $A2, $B2, $A3, $B3 ;#26
                       .DB $69, $00           ;#6
                       .DB $00, $00
                       .DB $A4, $B4, $A5, $B5 ;#25
                       .DB $6A, $00           ;#7
                       .DB $00, $00
                       .DB $A6, $B6, $A7, $B7 ;#24
                       .DB $6B, $00           ;#8
                       .DB $00, $00
                       .DB $A8, $B8, $A9, $B9 ;#27
                       .DB $FF, $FF, $FF, $FF
                       .DB $8A, $9A           ;#30
                       .DB $00, $00
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                       .DB $8B, $9B           ;#31
                       .DB $00, $00
                       .DB $FF, $FF, $FF, $FF
                       .DB $8E, $9E, $8F, $9F ;#14
                       .DB $A0, $B0, $A1, $B1 ;#15
                       .DB $00, $00, $00, $00
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
                       .DB $9C, $00           ;#32
                       .DB $00, $00
                       .DB $84, $94, $85, $95 ;#36
                       .DB $82, $92, $83, $93 ;#35
                       .DB $80, $90, $81, $91 ;#34
                       .DB $9D, $00, $00, $00 ;#33
                       .DB $AE, $BE, $AF, $BF ;#39
                       .DB $AC, $BC, $AD, $00 ;#38
                       .DB $AA, $BA, $AB, $BB ;#37

;
L14E0:
                       LD      B,A                 ; save A
                       LD      A,(DSW0)            ; 78xx DSW0
                       AND     $10                 ; Coinage
                       RET     Z                   ; return if no coins entered
                       EX      DE,HL               ;
                       LD      A,D                 ;
                       CP      $18                 ;
                       RET     NZ                  ;
                       LD      A,E                 ;
                       CP      $95                 ;
                       LD      (HL),$22            ;
                       RET     Z                   ;
                       CP      $9A                 ;
                       LD      (HL),$13            ;
                       RET     Z                   ;
                       CP      $B5                 ;
                       LD      (HL),$24            ;
                       RET     Z                   ;
                       LD      (HL),B              ;
                       RET                         ;

                       .ORG $1500
; Copied inside $4B70-$4BAF.
; Init values for the alien control states A and B.
T1500:
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $08, $6C, $09, $60
                       .DB $09, $60, $09, $60
; Init values for 16 aliens.
; Pointer to alien movement pattern table.
T1520:
                       .MSFIRST
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
                       .DW T1000
; Level 2 initial screen coordinates for the aliens.
; First byte is X, 2nd byte is Y. There are 16 aliens
; on the level (numbered here 0 - F). The starts are shown
; on the screen below.
;
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 00 - . S C O R E 1 . . H I - S C O R E . . S C O R E 2 .
; 08 - . 0 0 0 0 0 0 . . . 0 0 0 0 0 0 . . . 0 0 0 0 0 0 .
; 10 - . . . * 1 . . . . . C O I N 0 0 . . . . . * 0 . . .
; 18 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 20 - . . . . . . . . . . 0 . . . 1 . . . . . . . . . . .
; 28 - . . . . . . . . . . . . 2 . . . . . . . . . . . . .
; 30 - . . . . . . 8 . . . . . . . . . . . 9 . . . . . . .
; 38 - . . . . A . . . 6 . . . 3 . . . 7 . . . B . . . . .
; 40 - . . . . . . . . . . 4 . . . 5 . . . . . . . . . . .
; 48 - . . . C . . . . . . . . E . . . . . . . . D . . . .
; 50 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 58 - . . . . . . . . . . . . F . . . . . . . . . . . . .
;
T1540:
                       .DB $50, $20     ; 0 : x,y = 50,20 (decimal 80,32)
                       .DB $70, $20     ; 1
                       .DB $60, $28     ; 2
                       .DB $60, $38     ; 3
                       .DB $50, $40     ; 4
                       .DB $70, $40     ; 5
                       .DB $40, $38     ; 6
                       .DB $80, $38     ; 7
                       .DB $30, $30     ; 8
                       .DB $90, $30     ; 9
                       .DB $20, $38     ; A
                       .DB $A0, $38     ; B
                       .DB $18, $48     ; C
                       .DB $A8, $48     ; D
                       .DB $60, $48     ; E
                       .DB $60, $58     ; F

; Level 1 initial screen coordinates for the aliens.
; Same structure as 1540 above.
;
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 00 - . S C O R E 1 . . H I - S C O R E . . S C O R E 2 .
; 08 - . 0 0 0 0 0 0 . . . 0 0 0 0 0 0 . . . 0 0 0 0 0 0 .
; 10 - . . . * 1 . . . . . C O I N 0 0 . . . . . * 0 . . .
; 18 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 20 - . . . . . . . E . . . . . . . . . F . . . . . . . .
; 28 - . . . . . C . . . . . . . . . . . . . D . . . . . .
; 30 - . . . A . . . . . . . . . . . . . . . . . B . . . .
; 38 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 40 - . . . 8 . . . . . . . . . . . . . . . . . 9 . . . .
; 48 - . . . . . 6 . . . . . . 0 . . . . . . 7 . . . . . .
; 50 - . . . . . . . 4 . . . . . . . . . 5 . . . . . . . .
; 58 - . . . . . . . . . 2 . . 1 . . 3 . . . . . . . . . .
;
T1560:
                       .DB $60, $48     ; 0
                       .DB $60, $58     ; 1
                       .DB $48, $58     ; 2
                       .DB $78, $58     ; 3
                       .DB $38, $50     ; 4
                       .DB $88, $50     ; 5
                       .DB $28, $48     ; 6
                       .DB $98, $48     ; 7
                       .DB $18, $40     ; 8
                       .DB $A8, $40     ; 9
                       .DB $18, $30     ; A
                       .DB $A8, $30     ; B
                       .DB $28, $28     ; C
                       .DB $98, $28     ; D
                       .DB $38, $20     ; E
                       .DB $88, $20     ; F

;level 10 initial screen coordinates for the aliens.
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 20 - . . . . . . . . . . 1 . 0 . 2 . . . . . . . . . . .
; 28 - . . . . . . . . 3 . . . . . . . 4 . . . . . . . . .
; 30 - . . . . . . 5 . . . . . . . . . . . 6 . . . . . . .
; 38 - . . . . 7 . . . . . . . . . . . . . . . 8 . . . . .
; 40 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 48 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 50 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 58 - . . . . . . E . C . A . 9 . B . D . F . . . . . . .
;
T1580:
                       .DB $60, $20     ; 0
                       .DB $50, $20     ; 1
                       .DB $70, $20     ; 2
                       .DB $40, $28     ; 3
                       .DB $80, $28     ; 4
                       .DB $30, $30     ; 5
                       .DB $90, $30     ; 6
                       .DB $20, $38     ; 7
                       .DB $A0, $38     ; 8
                       .DB $60, $58     ; 9
                       .DB $50, $58     ; A
                       .DB $70, $58     ; B
                       .DB $40, $58     ; C
                       .DB $80, $58     ; D
                       .DB $30, $58     ; E
                       .DB $90, $58     ; F

;level 7 initial screen coordinates for the aliens.
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 20 - . . . . . . . . . . . . 0 . . . . . . . . . . . . .
; 28 - . . . . . . . . . . 1 . . . 2 . . . . . . . . . . .
; 30 - . . . . . . . . 3 . . . . . . . 4 . . . . . . . . .
; 38 - . . . . . . 5 . . . . . . . . . . . 6 . . . . . . .
; 40 - . . . . 7 . . . . . . . . . . . . . . . 8 . . . . .
; 48 - . . . . . . E . . . . . . . . . . . F . . . . . . .
; 50 - . . . . . . . . C . . . . . . . D . . . . . . . . .
; 58 - . . . . . . . . . . A . 9 . B . . . . . . . . . . .
;
T15A0:
                       .DB $60, $20     ; 0
                       .DB $50, $28     ; 1
                       .DB $70, $28     ; 2
                       .DB $40, $30     ; 3
                       .DB $80, $30     ; 4
                       .DB $30, $38     ; 5
                       .DB $90, $38     ; 6
                       .DB $20, $40     ; 7
                       .DB $A0, $40     ; 8
                       .DB $60, $58     ; 9
                       .DB $50, $58     ; A
                       .DB $70, $58     ; B
                       .DB $40, $50     ; C
                       .DB $80, $50     ; D
                       .DB $30, $48     ; E
                       .DB $90, $48     ; F

;level 6 initial screen coordinates for the aliens.
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 20 - . . E . . . . . . . . . . . . . . . . . . . F . . .
; 28 - . . . . C . . . . . . . . . . . . . . . D . . . . .
; 30 - . . . . . . A . . . . . . . . . . . B . . . . . . .
; 38 - . . . . . . . . 8 . . . . . . . 9 . . . . . . . . .
; 40 - . . . . . . . . . . 6 . . . 7 . . . . . . . . . . .
; 48 - . . . . . . . . 4 . . . 3 . . . 5 . . . . . . . . .
; 50 - . . . . . . . . . . 1 . . . 2 . . . . . . . . . . .
; 58 - . . . . . . . . . . . . 0 . . . . . . . . . . . . .
;
T15C0:
                       .DB $60, $58     ; 0
                       .DB $50, $50     ; 1
                       .DB $70, $50     ; 2
                       .DB $60, $48     ; 3
                       .DB $40, $48     ; 4
                       .DB $80, $48     ; 5
                       .DB $50, $40     ; 6
                       .DB $70, $40     ; 7
                       .DB $40, $38     ; 8
                       .DB $80, $38     ; 9
                       .DB $30, $30     ; A
                       .DB $90, $30     ; B
                       .DB $20, $28     ; C
                       .DB $A0, $28     ; D
                       .DB $10, $20     ; E
                       .DB $B0, $20     ; F

;level 5 initial screen coordinates for the aliens.
;      0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 A A B B C C
;      0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8 0 8
;      | | | | | | | | | | | | | | | | | | | | | | | | | |
; 20 - . . . . . . . . . . . . 0 . . . . . . . . . . . . .
; 28 - . . . . . . . . . . 1 . . . 2 . . . . . . . . . . .
; 30 - . . . . . . . . 3 . . . . . . . 4 . . . . . . . . .
; 38 - . . . . . . 5 . . . . . . . . . . . 6 . . . . . . .
; 40 - . . . . 7 . . . . . . . . . . . . . . . 8 . . . . .
; 48 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 50 - . . . . . . . . . . . . . . . . . . . . . . . . . .
; 58 - . . . . . . . . . . . . . . . . . . . . . . . . . .
T15E0:
                       .DB $60, $20     ; 0
                       .DB $50, $28     ; 1
                       .DB $70, $28     ; 2
                       .DB $40, $30     ; 3
                       .DB $80, $30     ; 4
                       .DB $30, $38     ; 5
                       .DB $90, $38     ; 6
                       .DB $20, $40     ; 7
                       .DB $A0, $40     ; 8
                       .DB $60, $20     ; 9 (two aliens at same position)
                       .DB $50, $28     ; A (two aliens at same position)
                       .DB $70, $28     ; B (two aliens at same position)
                       .DB $40, $30     ; C (two aliens at same position)
                       .DB $80, $30     ; D (two aliens at same position)
                       .DB $30, $38     ; E (two aliens at same position)
                       .DB $90, $38     ; F (two aliens at same position)
;
;?
T1600:
                       .DB $10, $14, $18, $1C
                       .DB $00, $04, $08, $0C
                       .DB $20, $22, $24, $26
                       .DB $28, $2A, $2C, $2E
                       .DB $30, $32, $34, $36
                       .DB $38, $3A, $3C, $3E
                       .DB $40, $42, $44, $46
                       .DB $5C, $5C, $5E, $5E

; 8 player bullets for the fine bit shifting
T1620:
                       .DB $50, $51, $52, $53, $54, $55, $56, $57
;
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
;?
                       .DB $48, $48, $50, $50, $4A, $4A, $52, $52, $4C, $4C, $54, $54, $4E, $4E, $56, $56
                       .DB $48, $48, $56, $56, $4E, $4E, $54, $54, $4C, $4C, $52, $52, $4A, $4A, $50, $50
                       .DB $68, $68, $6C, $6C, $70, $70, $74, $74, $78, $78, $7C, $7C, $80, $80, $84, $84
                       .DB $68, $68, $84, $84, $80, $80, $7C, $7C, $78, $78, $74, $74, $70, $70, $6C, $6C
                       .DB $58, $58, $5A, $5A, $5C, $5C, $5E, $5E, $60, $60, $62, $62, $64, $64, $66, $66
                       .DB $78
                       .DB $FF
                       .DB $A0
                       .DB $FF, $FF
                       .DB $A8
                       .DB $FF
                       .DB $AC, $C0
                       .DB $FF
                       .DB $C8
                       .DB $FF, $FF
                       .DB $C4
                       .DB $FF
                       .DB $CC, $D0
                       .DB $FF
                       .DB $D8
                       .DB $FF, $FF
                       .DB $D4
                       .DB $FF
                       .DB $DC
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
;?
                       .DB $01, $02, $08
                       .DB $01, $02, $08
                       .DB $01, $02, $0C
                       .DB $01, $02, $10
                       .DB $03, $04, $14
                       .DB $03, $04, $18
                       .DB $04, $01, $88
                       .DB $04, $01, $90
                       .DB $04, $01, $80
                       .DB $04, $01, $80
                       .DB $03, $04, $70
                       .DB $03, $04, $74
                       .DB $03, $04, $78
                       .DB $03, $04, $7C
                       .DB $FF, $FF, $FF
;?
                       .DB $01, $02, $30
                       .DB $01, $02, $34
                       .DB $01, $02, $38
                       .DB $01, $02, $3C
                       .DB $01, $02, $40
                       .DB $01, $02, $44
                       .DB $01, $02, $48
                       .DB $01, $02, $4C
                       .DB $04, $04, $50
                       .DB $04, $04, $54
                       .DB $04, $04, $58
                       .DB $04, $04, $5C
                       .DB $04, $04, $60
                       .DB $04, $04, $64
                       .DB $04, $04, $68
                       .DB $04, $04, $6C
;?
T1700:
                       .DB $FF, $FF, $01, $00, $FF, $00, $04, $00, $FC, $00, $00, $FC, $00, $04, $04, $FE ;
                       .DB $FC, $FE, $04, $02, $FC, $02, $00, $04, $00, $04, $00, $04, $00, $04, $FF, $FF ;
                       .DB $FC, $00, $FC, $00, $FC, $00, $FC, $00, $04, $00, $04, $00, $04, $00, $04, $00 ;
                       .DB $04, $FC, $04, $04, $FC, $04, $FC, $FC, $FC, $FC, $FC, $04, $04, $04, $04, $FC ;
T1740:
                       .DB $08, $00, $00, $FF, $01, $00, $F8, $FF, $08, $01, $02, $FF, $04, $00, $FA, $FF ;
                       .DB $08, $01, $04, $FF, $08, $00, $FC, $FF, $08, $05, $06, $FF, $08, $00, $FE, $FF ;

; Parity table and initial number of aliens/birds for levels:
; odd, odd, even (P), even (P), odd, odd, odd, odd
; used with $43B8 LevelAndRound.
T1760:
                       .DB $10, $10, $88, $88, $10, $10, $10, $10 ;
;
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ;
;
T1770:
                       .DB $EC, $FC, $FD, $F4, $ED, $30, $40, $F5, $EE, $31, $41, $F6, $EF, $FF, $FE, $F7 ; Object 1770 Regular ship, large shields
                       .DB $E8, $F8, $F9, $F0, $E9, $30, $40, $F1, $EA, $31, $41, $F2, $EB, $FB, $FA, $F3 ; Object 1780 Regular ship, small shields
                       .DB $E8, $F8, $F9, $F0, $E9, $E4, $E6, $F1, $EA, $E5, $E7, $F2, $EB, $FB, $FA, $F3 ; Object 1790 Green ship, large shields
                       .DB $00, $00, $00, $00, $00, $E4, $E6, $00, $00, $E5, $E7, $00, $00, $00, $00, $00 ; Object 17A0 Green ship, no shields

;
                       .DB $F0, $CA, $C4, $BE, $B8, $BE, $B8, $BE ; LSB's of the Alien explosion frame sequence (#5,#4,#3,#2,#1,#2,#1,#2) why wrong order?
;
                       .DB $C8, $D8, $C9, $D9, $CA, $DA ; Object 17B8 3x2 Alien explosion frame #1
                       .DB $CB, $DB, $CC, $DC, $CD, $DD ; Object 17BE 3x2 Alien explosion frame #2
                       .DB $C0, $C1, $C1, $C2, $00, $C0 ; Object 17C4 3x2 Alien explosion frame #3
                       .DB $00, $00, $00, $C3, $00, $00 ; Object 17CA 3x2 Alien explosion frame #4
;
T17D0:
                       .DB $C4, $D4, $C5, $D5, $C3, $C3 ; Object 17D0 3x2 Bonus explosion left part
T17D6:
                       .DB $C3, $C3, $C6, $D6, $C7, $D7 ; Object 17D6 3x2 Bonus explosion right part

                       .ORG $17E0
;
CoinChecking:
                       LD      A,(DSW0)            ; 78xx DSW0
                       AND     $10                 ; Coinage
                       LD      A,(CoinCount)       ; 
                       RET     Z                   
                       RRCA                        
                       AND     $0F                 
                       RET                         

                       .ORG $17F0
; Used for blank out characters
; and Alien explosion frame #5
FourByFourEmpty:
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

; Screen ram adresses and static texts using setA
T1800:
                       .DB $43, $20
                       .DB $FF, $FF, $FF, $FF
; " SCORE1  HI-SCORE  SCORE2 "
                       .DB $00, $13, $03, $0F, $12, $05, $21, $00, $00, $08, $09, $2B, $13, $03, $0F, $12, $05, $00, $00, $13, $03, $0F, $12, $05, $22, $00

                       .DB $43, $21
                       .DB $FF, $FF, $FF, $FF
; " 000000   000000   000000 "
                       .DB $00, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20, $20, $20, $00, $00, $00, $20, $20, $20, $20, $20, $20, $00

                       .DB $43, $22
                       .DB $FF, $FF, $FF, $FF
; "   %0     COIN00     %0   "
                       .DB $00, $00, $00, $7F, $20, $00, $00, $00, $00, $00, $03, $0F, $09, $0E, $20, $20, $00, $00, $00, $00, $00, $7F, $20, $00, $00, $00

T1860:
                       .DB $43, $25
                       .DB $FF, $FF, $FF, $FF
; "       INSERT  COIN       "
                       .DB $00, $00, $00, $00, $00, $00, $00, $09, $0E, $13, $05, $12, $14, $00, $00, $03, $0F, $09, $0E, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $27
                       .DB $FF, $FF, $FF, $FF
; "   * 1PLAYER   1COIN  *   "
                       .DB $00, $00, $00, $1F, $00, $21, $10, $0C, $01, $19, $05, $12, $00, $00, $00, $21, $03, $0F, $09, $0E, $00, $00, $1F, $00, $00, $00

                       .DB $43, $29
                       .DB $FF, $FF, $FF, $FF
; "   * 2PLAYERS  2COINS *   "
                       .DB $00, $00, $00, $1F, $00, $22, $10, $0C, $01, $19, $05, $12, $13, $00, $00, $22, $03, $0F, $09, $0E, $13, $00, $1F, $00, $00, $00

                       .DB $43, $2E
                       .DB $FF, $FF, $FF, $FF
; "   SCORE AVERAGE TABLE    "
                       .DB $00, $00, $00, $13, $03, $0F, $12, $05, $00, $01, $16, $05, $12, $01, $07, $05, $00, $14, $01, $02, $0C, $05, $00, $00, $00, $00

                       .DB $43, $30
                       .DB $FF, $FF, $FF, $FF
; "        20 40 80          "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $22, $20, $00, $24, $20, $00, $28, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $33
                       .DB $FF, $FF, $FF, $FF
; "        200               "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $22, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $36
                       .DB $FF, $FF, $FF, $FF
; "        50 100 ?[100-800] "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $25, $20, $00, $21, $20, $20, $00, $2F, $1B, $21, $20, $20, $2B, $28, $20, $20, $1C, $00

                       .DB $43, $39
                       .DB $FF, $FF, $FF, $FF
; "        1000-9000         "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $21, $20, $20, $20, $2B, $29, $20, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00

T1960:
                       .DB $43, $3C
                       .DB $00, $00, $32, $21
; "PHOENIX% COPYRIGHT 1980   "
                       .DB $10, $08, $0F, $05, $0E, $09, $18, $7E, $00, $03, $0F, $10, $19, $12, $09, $07, $08, $14, $00, $21, $29, $28, $20, $00, $00, $00

                       .DB $43, $3D
                       .DB $02, $05, $21, $28
; " AMSTAR ELECTRONICS CORP. "
                       .DB $00, $01, $0D, $13, $14, $01
L198C:
                       .DB $12, $00, $05, $0C, $05, $03, $14, $12, $0F, $0E, $09, $03, $13, $00, $03, $0F, $12, $10, $2A, $00

                       .DB $43, $3E
                       .DB $FF, $FF, $FF, $FF
; "  PHOENIX AZ. U.S.A.      "
                       .DB $00, $00, $10, $08, $0F, $05, $0E, $09, $18, $00, $01, $1A, $2A, $00, $15, $2A, $13, $2A, $01, $2A, $00, $00, $00, $00, $00, $00

T19C0:
                       .DB $43, $28
                       .DB $FF, $FF, $FF, $FF
; "           PUSH           "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $15, $13, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $2C
                       .DB $FF, $FF, $FF, $FF
; "    ONLY 1PLAYER BUTTON   "
                       .DB $00, $00, $00, $00, $0F, $0E, $0C, $19, $00, $21, $10, $0C, $01, $19, $05, $12, $00, $02, $15, $14, $14, $0F, $0E, $00, $00, $00

T1A00:
                       .DB $43, $28
                       .DB $FF, $FF, $FF, $FF
; "        GAME  OVER        "
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $07, $01, $0D, $05, $00, $00, $0F, $16, $05, $12, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $28
                       .DB $00, $FF, $FF, $FF
; "%%%%%%%%                %%"
                       .DB $64, $65, $64, $65, $64, $65, $60, $61, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $78, $79

                       .DB $43, $29
                       .DB $FF, $FF, $FF, $FF
; "%%    %%                %%"
                       .DB $64, $65, $00, $00, $00, $00, $64, $65, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $7C, $7D

                       .DB $43, $2A
                       .DB $FF, $FF, $FF, $FF
; "%%%%%%%%                  "
                       .DB $64, $65, $64, $65, $64, $65, $60, $61, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $2B
                       .DB $FF, $FF, $FF, $FF
; "%%                        "
                       .DB $64, $65, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

                       .DB $43, $2C
                       .DB $FF, $FF, $FF, $FF
; "%% % % %%% %%% %% % % %  %"
                       .DB $64, $65, $00, $68, $00, $68, $00, $68, $68, $68, $00, $68, $64, $65, $00, $62, $63, $00, $68, $00, $68, $00, $68, $00, $00, $68

                       .DB $43, $2D
                       .DB $FF, $FF, $FF, $FF
; "%% % % % % %   %% % % %%%%"
                       .DB $64, $65, $00, $68, $00, $68, $00, $68, $00, $68, $00, $68, $00, $00, $00, $68, $9D, $00, $68, $00, $68, $00, $76, $77, $70, $71

                       .DB $43, $2E
                       .DB $FF, $FF, $FF, $FF
; "%% %%% % % %%% %%%% %  %% "
                       .DB $64, $65, $00, $68, $68, $68, $00, $68, $00, $68, $00, $68, $62, $63, $00, $68, $76, $77, $68, $00, $68, $00, $00, $64, $65, $00

                       .DB $43, $2F
                       .DB $00, $00, $00, $00
; "%% % % % % %   % %% % %%%%"
                       .DB $64, $65, $00, $68, $00, $68, $00, $68, $00, $68, $00, $68, $00, $00, $00, $68, $00, $9D, $68, $00, $68, $00, $74, $75, $72, $73

                       .DB $43, $30
                       .DB $FF, $FF, $FF, $FF
; "%% % % %%% %%% % %% % %  %"
                       .DB $64, $65, $00, $68, $00, $68, $00, $68, $68, $68, $00, $68, $64, $65, $00, $68, $00, $66, $67, $00, $68, $00, $68, $00, $00, $68

;alien character block shapes table using setA (for fade in)
T1B40:
                       .DB $6C              ;#9
                       .DB $6D              ;#10
                       .DB $6E              ;#11
                       .DB $6F              ;#12

                       .ORG $1B48
;character block shapes table using setB
;parts of the mothership's purple conveyor belt
T1B48:
                       .DB $6C, $6D, $6E, $6F, $64, $65, $66, $67, $63, $FF
                       .DB $63, $61, $67, $FF
                       .DB $67, $65, $6B, $FF
                       .DB $6B, $69, $6F, $FF
                       .DB $6F, $6D

;characters used for explosions using setB
T1B60:
                       .DB $80, $83, $83, $85, $81, $8C, $8C, $86, $81, $8C, $8C, $86, $82, $84, $84, $87
                       .DB $00, $89, $89, $00, $88, $8D, $8D, $8B, $88, $8D, $8D, $8B, $00, $8A, $8A, $00
                       .DB $00, $00, $00, $00, $00, $80, $85, $00, $00, $82, $87, $00, $00, $00, $00, $00

;adress table for instumentation of explosion
T1B90:
                       .DB $1B, $80
                       .DB $1B, $70
                       .DB $1B, $60
                       .DB $1B, $70
                       .DB $17, $F0                         ;for deletion
                       .DB $17, $F0                         ;
                       .DB $17, $F0                         ;
                       .DB $17, $F0                         ;

;characters using setA: '1 OR 2 PLAYERS BUTTON'
T1BA0:
                       .DB $43, $2C                         ; screen ram position
                       .DB $00, $00, $00, $00, $00, $00, $00, $21, $00, $0F, $12, $00, $22, $10
                       .DB $0C, $01, $19, $05, $12, $13, $00, $02, $15, $14, $14, $0F, $0E, $00, $00, $00

;characters using setB for animation of the mothership's
;.....antenna animation and the
;...........alien pilot animation
T1BC0:
                       .DB $41, $54, $76, $7E   ; frame 0
                       .DB $42, $55, $77, $7F   ;
                       .DB $41, $56, $74, $7C   ; frame 1
                       .DB $42, $57, $75, $7D   ;
                       .DB $44, $51, $72, $7A   ; frame 2
                       .DB $45, $52, $73, $7B   ;
                       .DB $46, $51, $70, $78   ; frame 3
                       .DB $47, $52, $71, $79   ;
                       .DB $41, $51, $70, $78   ; frame 4
                       .DB $42, $52, $71, $79   ;
                       .DB $41, $51, $72, $7A   ; frame 5
                       .DB $42, $52, $73, $7B   ;
                       .DB $41, $51, $74, $7C   ; frame 6
                       .DB $42, $52, $75, $7D   ;
                       .DB $41, $51, $76, $7E   ; frame 7
                       .DB $42, $52, $77, $7F   ;

;part of the starfield (without planets) using setB
; This is a 20x9 tile image used to erase the mothership
T1C00:
                       .DB $00, $01, $00, $06, $00, $02, $03, $04, $00, $01, $00, $08, $00, $02, $03, $04, $00, $00, $07, $00
                       .DB $01, $02, $00, $09, $00, $03, $04, $00, $00, $03, $04, $00, $00, $01, $00, $02, $00, $03, $0A, $00
                       .DB $04, $00, $00, $01, $02, $00, $06, $00, $03, $04, $00, $00, $01, $00, $02, $00, $03, $00, $04, $00
                       .DB $03, $05, $00, $00, $00, $00, $07, $00, $01, $00, $02, $00, $00, $05, $00, $00, $03, $00, $04, $01
                       .DB $02, $00, $03, $00, $08, $04, $00, $01, $02, $06, $00, $03, $00, $04, $00, $02, $01, $02, $03, $00
                       .DB $05, $00, $00, $04, $00, $01, $02, $00, $00, $03, $04, $0B, $00, $01, $00, $02, $00, $03, $00, $00
                       .DB $04, $00, $00, $09, $00, $00, $02, $00, $07, $00, $00, $01, $00, $00, $02, $00, $00, $03, $00, $08
                       .DB $04, $00, $01, $00, $00, $06, $00, $01, $00, $02, $00, $01, $03, $04, $01, $03, $01, $02, $03, $04
                       .DB $00, $05, $00, $01, $02, $00, $09, $00, $03, $04, $00, $01, $00, $01, $02, $03, $04, $00, $02, $00

                       .DB $00, $01, $02, $00, $03, $04, $00, $06, $00, $00, $01, $00
                       .DB $00, $01, $02, $00, $05, $00, $00, $03, $00, $04, $00, $07, $00, $01, $00, $02
                       .DB $00, $00, $03, $00, $04, $00, $04, $00, $0A, $00, $01, $00, $02, $00, $03, $00
                       .DB $01, $00, $07, $00, $02, $00, $03, $04, $00, $05, $00, $01, $00, $02, $00, $00
                       .DB $08, $03, $04, $00, $01, $00, $02, $00, $03, $00, $04, $00, $00, $06, $00, $03

; Mother ship object 26x9 tiles (upside down)
; Object 1D00
; Maybe these are upside down because the mother ship scrolls down from the top
; of the screen. The rows appear in the order given here.
T1D00:
                       .DB $0C, $0D, $0C, $0F, $07, $07, $01, $00, $00, $4C, $4D, $4E, $4F, $4F, $4E, $4D, $4C, $00, $00, $1F, $0E, $06, $0D, $01, $0E, $05
                       .DB $08, $0C, $0E, $0C, $0A, $00, $00, $4D, $4F, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $4F, $4D, $00, $00, $06, $0B, $0D, $08, $0E
                       .DB $03, $02, $00, $01, $00, $4C, $4F, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $4F, $4C, $00, $09, $07, $0A, $03
                       .DB $04, $00, $0A, $00, $4D, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $5E, $4D, $00, $00, $0E, $0F
                       .DB $08, $08, $00, $5C, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $60, $6A, $5D, $00, $01, $02
                       .DB $02, $06, $01, $00, $00, $00, $58, $59, $5A, $5B, $5B, $5B, $7E, $7F, $5B, $5B, $5B, $4A, $49, $48, $00, $00, $00, $03, $0E, $0B
                       .DB $0D, $05, $04, $05, $0A, $08, $00, $00, $58, $59, $5A, $4B, $76, $77, $4B, $4A, $49, $48, $00, $00, $01, $03, $0F, $02, $03, $00
                       .DB $00, $03, $03, $07, $02, $0A, $03, $07, $00, $00, $58, $50, $51, $52, $53, $48, $00, $00, $0B, $01, $02, $03, $0F, $0E, $0C, $02
                       .DB $05, $0C, $06, $00, $04, $06, $07, $0E, $0F, $09, $00, $40, $41, $42, $43, $00, $07, $03, $0A, $08, $0D, $00, $09, $0B, $0C, $0A

                       .ORG $1DF0
;
L1DF0:
                       LD      A,(ForegroundScreen+$31D)
                       SUB     $01                 
                       RET     Z                   
; never called ?
                       LD      (CoinCount),A       ;
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
;
;data for the 8 (2x2) planets / galaxies from setB
T1E00:
                       .DB $20, $30, $21, $31
                       .DB $22, $32, $23, $33
                       .DB $24, $34, $25, $35
                       .DB $26, $36, $27, $37
                       .DB $28, $38, $29, $39
                       .DB $2A, $3A, $2B, $3B
                       .DB $2C, $3C, $2D, $3D
                       .DB $2E, $3E, $2F, $3F
;MSB's of screen ram for planets / galaxies
T1E20:
                       .DB $49, $48, $4A, $4B
                       .DB $4A, $49, $4A, $49
                       .DB $48, $4A, $48, $49
                       .DB $4B, $48, $4A, $48
                       .DB $4A, $49, $4B, $49
                       .DB $4B, $4A, $49, $48
                       .DB $49, $49, $4A, $4A
                       .DB $48, $49, $4A, $48
;
T1E40:
                       .DB $A0, $60, $40, $00
                       .DB $E0, $C0, $C0, $60
                       .DB $80, $20, $60, $40
                       .DB $20, $40, $00, $80
                       .DB $40, $00, $20, $E0
                       .DB $00, $60, $00, $A0
                       .DB $E0, $20, $80, $00
                       .DB $C0, $80, $A0, $E0
;LSB's of screen ram for planets / galaxies
T1E60:
                       .DB $00, $04, $08, $0C
                       .DB $10, $14, $18, $1C
                       .DB $00, $08, $10, $18
                       .DB $04, $0C, $14, $1C
                       .DB $00, $0C, $18, $04
                       .DB $04, $1C, $08, $14
                       .DB $00, $10, $04, $14
                       .DB $08, $18, $0C, $1C
;data for the 16 (1x1) small galaxies from setB
T1E80:
                       .DB $10, $11, $12, $13
                       .DB $14, $15, $16, $17
                       .DB $18, $19, $1A, $1B
                       .DB $1C, $1D, $1E, $1F
                       .DB $10, $12, $14, $16
                       .DB $18, $1A, $1C, $1E
                       .DB $11, $13, $15, $17
                       .DB $19, $1B, $1D, $1F
;
T1EA0:
                       .DB $4A, $4B, $49, $4A
                       .DB $48, $4A, $48, $49
                       .DB $49, $4A, $49, $4B
                       .DB $48, $4B, $4A, $4A
                       .DB $48, $49, $48, $4A
                       .DB $48, $48, $49, $4A
                       .DB $49, $49, $4A, $48
                       .DB $4A, $49, $4B, $48
;
T1EC0:
                       .DB $00, $20, $60, $40
                       .DB $E0, $80, $20, $60
                       .DB $40, $A0, $00, $00
                       .DB $40, $20, $C0, $20
                       .DB $A0, $80, $E0, $40
                       .DB $60, $C0, $20, $A0
                       .DB $E0, $40, $60, $C0
                       .DB $20, $40, $20, $80

;*****************************************************************************
;* Used for the animation speed at bird intro.
;*****************************************************************************
L1EE0:
                       LD      DE,ForegroundScreen+$33D ; holding 0
                       LD      BC,$001A            ;
L1EE6:
                       LD      A,(DE)              ;
                       ADD     A,B                 ;
                       LD      B,A                 ;
                       CALL    RightOneColumn      ;
                       DEC     C                   ;
                       JP      NZ,L1EE6            ;
                       LD      A,(DE)              ;
                       ADD     A,B                 ;
                       ADD     $27                 ;
                       LD      HL,HiScorehigh      ;
                       ADD     A,(HL)              ;
                       LD      (HL),A              ;
                       NOP                         ;
                       RET                         ;

                       .ORG $1F00
;
; Part of the starfield background without planets
T1F00:
                       .DB $00, $00, $00, $01, $00, $00, $00, $02, $00, $00, $00, $00, $03, $00, $00, $00
                       .DB $00, $04, $00, $00, $00, $00, $01, $00, $00, $00, $05, $00, $02, $00, $03, $00
                       .DB $00, $00, $04, $00, $07, $00, $00, $00, $06, $00, $01, $00, $02, $0C, $00, $03
                       .DB $04, $00, $00, $01, $00, $08, $00, $00, $02, $00, $0C, $03, $04, $0E, $00, $00
                       .DB $00, $01, $02, $00, $0D, $03, $04, $0F, $01, $0C, $07, $0A, $02, $0D, $03, $08
                       .DB $06, $0C, $04, $09, $05, $0F, $01, $02, $0D, $03, $0C, $04, $0D, $05, $0F, $0C
                       .DB $01, $02, $0E, $0C, $03, $0F, $0D, $05, $0E, $0D, $0C, $0F, $0D, $04, $0C, $01
                       .DB $0E, $05, $0F, $0D, $07, $0C, $06, $0E, $0D, $0F, $09, $0C, $0F, $0D, $0E, $0D
                       .DB $02, $0D, $0C, $0F, $05, $0E, $0D, $0C, $0F, $06, $0E, $0F, $0C, $0D, $0F, $0C
                       .DB $06, $0D, $04, $0B, $0C, $0F, $05, $0D, $05, $03, $0E, $07, $0C, $0D, $04, $05
                       .DB $01, $02, $0E, $03, $0C, $04, $0F, $05, $08, $0C, $07, $01, $0D, $04, $0E, $02
                       .DB $0C, $01, $0F, $03, $05, $0D, $00, $0E, $00, $09, $0C, $06, $0D, $00, $01, $02
                       .DB $01, $02, $03, $00, $00, $0D, $00, $0A, $00, $00, $00, $0E, $00, $05, $00, $08
                       .DB $00, $0C, $00, $00, $03, $00, $00, $07, $00, $00, $00, $04, $00, $00, $06, $00
                       .DB $00, $00, $00, $01, $00, $00, $00, $00, $02, $00, $00, $00, $00, $03, $00, $00
                       .DB $00, $04, $00, $05, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $02, $00
;*****************************************************************************
;* Game level 1, 3 and B:
;* 'player alife' with aliens, after 'fade in'
;*****************************************************************************
L2000:
                       CALL    PlayerUpdate        ; Updates the player ship, player bullet and the shield.
                       CALL    L0DF0               ; alien bullet to player, collission detection ?
                       CALL    L24A0               ; 
                       LD      HL,M435F            ; 8 bit counter for alien movement
                       LD      A,(HL)              ; get value
                       AND     $03                 ; mask out 0000_0011 for count 0 to 3
                       LD      B,A                 ; save the masked counter
                       INC     (HL)                ; increment alien movement counter
                       LD      A,(AliensLeft)      ; 
                       AND     A                   ; updates the zero flag
                       JP      Z,L21BA             ; if no AliensLeft
                       CP      $05                 ;
                       JP      NC,L2130            ; if <= 5 left
                       DEC     L                   ; $435E
                       LD      A,B                 ; get masked counter
                       AND     A                   ; updates the zero flag
                       JP      NZ,L2025            ; if masked counter <> 0
                       LD      (HL),$FF            ; set all bits at $435E
L2025:
                       LD      A,(HL)              ; get $435E
                       AND     A                   ; updates the zero flag
                       JP      Z,L2130             ; if $435E = 0
                       JP      L2146               ; 

                       .ORG $2030
;
L2030:
                       AND     $03                 
                       CP      $01                 
                       LD      DE,$1B50            
                       JP      L23AC               ; 

                       .ORG $2040
;*****************************************************************************
;* Add 1x1 small galaxies to background.
;*****************************************************************************
AddGalaxiesToBackground:
                       LD      HL,M43AF            ; 
                       LD      A,(CounterB9)       ; 
                       LD      C,A                 ;
                       CP      (HL)                ;
                       RET     NZ                  ;
                       LD      A,(HL)              ;
                       INC     L                   ;
                       SUB     (HL)                ;
                       DEC     L                   ;
                       LD      (HL),A              ;
                       INC     L                   ;
                       INC     L                   ;
                       INC     (HL)                ;
                       LD      A,(HL)              ;
                       LD      HL,T1E80            ; data for the 16 (1x1) small galaxies from setB
                       AND     $1F                 ;
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      B,(HL)              ;
                       ADD     $20                 ;
                       LD      L,A                 ;
                       LD      D,(HL)              ;
                       ADD     $20                 ;
                       LD      L,A                 ;
                       LD      E,(HL)              ;
                       LD      A,C                 ;
                       RRCA                        ;
                       RRCA                        ;
                       RRCA                        ;
                       AND     $1F                 ;
                       ADD     A,E                 ;
                       INC     A                   ;
                       LD      E,A                 ;
                       LD      A,B                 ;
                       LD      (DE),A              ;
                       RET                         ;

                       .ORG $2070
;
L2070:
                       LD      A,E                 
                       SUB     $0A                 
                       ADD     $C0                 
                       LD      C,A                 
                       LD      A,D                 
                       ADC     $00                 
                       LD      B,A                 
                       LD      A,(HL)              
                       LD      DE,T2800            ; get the foreground tiles of the player ship particles explosion
                       LD      HL,T2900            ; and get the control data for it
                       JP      L2085               ; 

                       .ORG $2085
;
L2085:
                       SUB     $20                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       NOP                         
                       AND     $E0                 
                       LD      L,A                 
                       LD      A,$E0               
                       SUB     L                   
                       LD      L,A                 
L2091:
                       LD      A,$3F               
                       SUB     C                   
                       LD      A,$43               
                       SBC     B                   
                       JP      NC,L20B0            ; 
                       INC     HL                  
                       INC     HL                  
                       LD      A,E                 
                       ADD     $10                 
                       LD      E,A                 
                       LD      A,C                 
                       SUB     $20                 
                       LD      C,A                 
                       LD      A,B                 
                       SBC     $00                 
                       LD      B,A                 
                       JP      L2091               ; 

                       .ORG $20B0
;*****************************************************************************
;* Player ship particles explosion.
;*****************************************************************************
L20B0:
                       PUSH    BC                  
L20B1:
                       LD      A,(HL)              
                       EX      (SP),HL             
                       LD      B,$08               
L20B5:
                       LD      (HL),$00            
                       RRCA                        
                       JP      NC,L20BF            ; 
                       EX      DE,HL               
                       LD      C,(HL)              
                       EX      DE,HL               ; get data from $2800
                       LD      (HL),C              
L20BF:
                       INC     HL                  
                       INC     DE                  
                       DEC     B                   
                       JP      NZ,L20B5            ; 
                       EX      (SP),HL             
                       INC     HL                  
                       LD      A,L                 
                       RRCA                        
                       JP      C,L20B1             ; 
                       LD      A,L                 
                       AND     $1F                 
                       JP      Z,L20E1             ; 
                       EX      (SP),HL             
                       LD      A,L                 
                       SUB     $30                 
                       LD      L,A                 
                       LD      A,H                 
                       SBC     $00                 
                       LD      H,A                 
                       EX      (SP),HL             
                       CP      $3F                 
                       JP      NZ,L20B1            ; 
L20E1:
                       POP     BC                  
                       RET                         

                       .ORG $20E8
;
L20E8:
                       LD      B,A                 
                       LD      A,D                 
                       ADD     $08                 
                       LD      D,A                 
                       CALL    L211C               ; 
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       ADD     A,E                 
                       AND     $1F                 
                       LD      C,A                 
                       LD      A,E                 
                       AND     $E0                 
                       OR      C                   
                       LD      E,A                 
                       LD      A,B                 
                       RRCA                        
                       RRCA                        
                       AND     $0E                 
                       ADD     $90                 
                       LD      L,A                 
                       LD      H,$1B               
                       LD      A,(HL)              
                       INC     L                   
                       LD      L,(HL)              
                       LD      H,A                 
                       LD      BC,$0404            ; images are 4x4
                       JP      DrawImageCbyB       ; 

                       .ORG $211C
;
L211C:
                       LD      HL,CounterB9        ; 
                       LD      A,(HL)              
                       CP      $10                 
                       RET     C                   
                       CP      $30                 
                       RET     NC                  
                       LD      A,$10               
                       LD      (HL),A              
                       LD      (scrollRegister),A  ; 58xx scroll register
                       RET                         

                       .ORG $2130
;
L2130:
                       LD      A,B                 ; get masked counter
                       AND     A                   ; updates the zero flag
                       JP      Z,L2150             ; if = 0
                       CP      $01                 ;
                       JP      Z,L2160             ; if = 1
                       CP      $02                 ;
                       JP      Z,L2170             ; if = 2
                       JP      L2180               ; counter = 3

                       .ORG $2146
;
L2146:
                       LD      A,B                 
                       RRCA                        
                       JP      NC,L2190            ; 
                       JP      L21A5               ; 

                       .ORG $2150
; masked counter = 0
L2150:
                       CALL    AlienDataController ; draw or delete alien
                       CALL    L3000               ; 
                       JP      L0F00               ; 'alien with player' collision check

                       .ORG $2160
; masked counter = 1
L2160:
                       CALL    L24C4               ; 
                       CALL    L0C40               ; 
                       CALL    L0D1C               ; 
                       JP      L0FC0               ; Handle animations for killed aliens

                       .ORG $2170
; masked counter = 2
L2170:
                       CALL    L0D70               ; 
                       JP      L2560               ; 

                       .ORG $2180
; masked counter = 3
L2180:
                       CALL    L24C4               ; 
                       CALL    L0C40               ; 
                       CALL    L0A6C               ; get screen ram adress for all aliens
                       JP      L0FC0               ; Handle animations for killed aliens

                       .ORG $2190
;
L2190:
                       CALL    AlienDataController ; draw or delete alien
                       CALL    L3000               ; 
                       CALL    L0F00               ; 'alien with player' collision check
                       CALL    L2560               ; 
                       JP      L0C40               ; 

                       .ORG $21A5
;
L21A5:
                       CALL    L0D1C               ; 
                       CALL    L0D70               ; 
                       CALL    L0A6C               ; get screen ram adress for all aliens
                       CALL    L0FC0               ; Handle animations for killed aliens
                       JP      L24C4               ; 

                       .ORG $21BA
;
L21BA:
                       LD      A,B                 ;
                       RRCA                        ;
                       JP      NC,L2204            ; 
                       CALL    L0C40               ; 
                       CALL    L0FC0               ; Handle animations for killed aliens
                       CALL    L24C4               ; 
                       LD      A,(LevelAndRound)   ; 
                       AND     $0F                 ; mask out 0000_1111
                       CP      $0B                 ;
                       JP      C,L2204             ; if < game level B
                       LD      A,$10               ; 16 aliens for a new wave
                       LD      (AliensLeft),A      ; 
                       JP      L0526               ; init alien data

                       .ORG $21DC
;*****************************************************************************
;* Handles the bird animation at intro.
;*****************************************************************************
DrawIntroBirdAnimationFrame:
                       LD      A,(HL)              ; {ram.M4399} Actual index for slow print at intro splash (starts with $300)
                       NOP                         ;
                       LD      B,A                 ; save it
                       LD      HL,B4B73            ; used as temp memory
                       AND     $07                 ; mask out 0000_0111 in order to count from 0 to 7
                       LD      (HL),A              ; save it
                       DEC     L                   ;
                       LD      (HL),$EF            ; use $4B72 for LSB of screen ram
                       DEC     L                   ;
                       LD      (HL),$49            ; use $4B71 for MSB of screen ram
                       DEC     L                   ; $4B70 (bird0 index character block shape)
                       LD      A,B                 ; restore $4399
                       AND     $F8                 ; mask out 1111_1000
                       RRCA                        ; Divide by 8 ..
                       RRCA                        ; ..
                       RRCA                        ; ..
                       ADD     T233A & $FF         ; LSB of T233A
                       LD      E,A                 ;
                       LD      D,T233A >> 8        ; MSB of T233A
                       LD      A,(DE)              ; get data starting at T233A for animation frame index
                       LD      (HL),A              ; write to $4B70
                       CALL    DrawBirdObject      ; draw the bird at intro
                       JP      L1EE0               ; 

                       .ORG $2204
;
L2204:
                       LD      HL,M43B6            ; 
                       DEC     (HL)                ;
                       LD      A,(HL)              ;
                       CP      $A0                 ;
                       RET     NC                  ;
                       LD      L,$A4               ;
                       LD      (HL),$02            ; set GameState to: 'initialization of game and level data'
                       LD      L,$A6               ;
                       LD      (HL),$00            ; clear ShieldCount
                       LD      L,$B8               ;
                       INC     (HL)                ; increment LevelAndRound
                       LD      A,(HL)              ;
                       AND     $0E                 ; mask out 0000_1110
                       RRCA                        ; divide by 2
                       ADD     T1760 & $FF         ; add to base of table T1760
                       LD      E,A                 ;
                       LD      D,T1760 >> 8        ;
                       INC     L                   ;
                       INC     L                   ;
                       LD      A,(DE)              ; get value from table T1760
                       AND     A                   ; updates the flags
                       JP      P,L222A             ; if not positive.
                       INC     L                   ; use BirdsLeft
                       AND     $7F                 ; mask out 0111_1111
L222A:
                       LD      (HL),A              ; save to $43BA (AliensLeft) or $43BB (BirdsLeft)
                       JP      ClearForeground     ; 

                       .ORG $2230
;*****************************************************************************
;* Game level 4, 6 and 8:
;* Do the 'spiral fill' animation.
;*****************************************************************************
L2230:
                       LD      HL,M439C            ; 
                       LD      A,(HL)              ;
                       INC     (HL)                ;
                       NOP                         ;
                       RRCA                        ;
                       AND     $3F                 ; mask out 0011_1111
                       CP      $0D                 ;
                       JP      Z,L2292             ; 
                       LD      B,$1F               ; The asterisk character
                       JP      C,L2260             ; 
                       LD      B,$00               ; The space character
                       SUB     $0E                 ;
                       CP      $0D                 ;
                       JP      NZ,L2260            ; 
                       LD      HL,LevelAndRound    ; 
                       INC     (HL)                ; increment game level $43B8
                       LD      L,$A4               ; HL=43A4 -- game state
                       LD      (HL),$02            ; Next interval game state is 2: 'init game and level data'
                       RET                         ;

                       .ORG $2260
;
L2260:
                       LD      C,A                 ;
                       RRCA                        ;
                       RRCA                        ;
                       RRCA                        ;
                       LD      D,A                 ;
                       AND     $1F                 ;
                       LD      E,A                 ;
                       LD      A,D                 ;
                       AND     $E0                 ;
                       ADD     $B0                 ;
                       LD      L,A                 ;
                       LD      A,E                 ;
                       ADC     $41                 ;
                       LD      H,A                 ;
                       LD      A,L                 ;
                       SUB     C                   ;
                       LD      L,A                 ;
                       LD      A,C                 ;
                       INC     A                   ;
                       LD      C,A                 ;
                       RLCA                        ; Multiply by 2
                       LD      E,A                 ;
;
L227A:
                       LD      D,C                 ; D is the height counter for each pass
;
L227B:
                       LD      (HL),B              ; draw the asterisk or space
                       INC     HL                  ; one row down
                       LD      (HL),B              ; another asterisk or space
                       INC     HL                  ; one row down
                       DEC     D                   ; all of this column done?
                       JP      NZ,L227B            ; No ... do all rows
                       LD      A,L                 ; LSB of screen pointer
                       SUB     C                   ; move up ...
                       SUB     C                   ; ... height * 2
                       SUB     $20                 ; Move right one column
                       LD      L,A                 ; New LSB
                       LD      A,H                 ; Borrow into ...
                       SBC     $00                 ; ... the ...
                       LD      H,A                 ; ... MSB
                       DEC     E                   ; All columns done?
                       JP      NZ,L227A            ; no ... do all columns
                       RET                         ; Done
;
L2292:
                       LD      HL,LevelAndRound    ; 
                       LD      A,(HL)              ;
                       AND     $08                 ; mask out 0000_1000
                       JP      Z,L22F0             ; 
                       LD      HL,T1C00            ; Background stars to erase mother ship
                       LD      DE,$4B3F            ; End of background screen memory
                       LD      B,$47               ;
L22A3:
                       LD      A,(HL)              ;
                       LD      (DE),A              ;
                       INC     L                   ;
                       DEC     DE                  ;
                       LD      A,(HL)              ;
                       LD      (DE),A              ;
                       INC     L                   ;
                       DEC     DE                  ;
                       LD      A,B                 ;
                       CP      D                   ;
                       JP      NZ,L22A3            ; 
                       JP      L22E0               ; 

                       .ORG $22B4
;*****************************************************************************
;* Game level 9:
;* Mothership 'fade in' animation.
;*****************************************************************************
L22B4:
                       CALL    StarsScrollDown     ; 
                       LD      HL,CounterB4        ; 
                       DEC     (HL)                ;
                       LD      A,(HL)              ;
                       CP      $28                 ;
                       JP      NZ,L0848            ; 
                       LD      L,$67               ;
                       LD      (HL),$FF            ;
                       RET                         ;

                       .ORG $22CA
;*****************************************************************************
;* Game level A:
;* Mothership and aliens 'fade in'
;*****************************************************************************
L22CA:
                       LD      HL,CounterB4        ; 
                       LD      A,(HL)              ;
                       CP      $C0                 ;
                       JP      NZ,L0834            ; Stars scrolling down and 'aliens fade in'
                       LD      (HL),$30            ;
                       LD      L,$67               ;
                       LD      (HL),$FF            ;
                       LD      L,$BC               ;
                       LD      (HL),$3F            ;
                       RET                         ;

                       .ORG $22E0
;
L22E0:
                       LD      A,$71               ; init the ...
;
L22E2:
                       LD      (CounterB9),A       ; free running 8 bit backwards counter
                       LD      (scrollRegister),A  ; 58xx scroll register
                       RET                         ;

                       .ORG $22F0
;
L22F0:
                       CALL    ClearBackground     ; 
                       XOR     A                   ; A=0
                       JP      L22E2               ; 

                       .ORG $22FA
;
L22FA:
                       LD      HL,BackgroundScreen+$2AA
                       LD      B,$12               
                       LD      A,(BackgroundScreen+$8A)
                       LD      C,A                 
L2303:
                       LD      A,C                 
                       AND     $03                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       LD      D,A                 
                       LD      C,(HL)              
                       LD      A,C                 
                       AND     $0C                 
                       RRCA                        
                       RRCA                        
                       OR      D                   
                       OR      $60                 
                       LD      (HL),A              
                       LD      A,L                 
                       SUB     $20                 
                       LD      L,A                 
                       JP      NC,L231B            ; 
                       DEC     H                   
L231B:
                       DEC     B                   
                       JP      NZ,L2303            ; 
                       RET                         

                       .ORG $2322
;*****************************************************************************
;* Animation of the mothership's antenna and the alien pilot.
;*****************************************************************************
L2322:
                       LD      HL,AnimationCounter ; 
                       INC     (HL)                ; increment the animation counter
                       LD      A,(HL)              ;
                       AND     $07                 ; mask out 0000_0111, in order to count from 0 to 7 for 8 frames
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..to get..
                       RLCA                        ; ..the frame data adress (8 characters per frame)
                       ADD     T1BC0 & $FF         ; LSB of T1BC0
                       LD      L,A                 ;
                       LD      H,T1BC0 >> 8        ; MSB of T1BC0
                       LD      DE,BackgroundScreen+$1A6; at the middle of the mothership
                       LD      BC,$0402            ; images are 2x4
                       JP      DrawImageCbyB       ; 
;
; Bird animation frame indexes at splash intro.
; Mapping to:?
T233A:
                       .DB $01, $02, $03, $04, $05, $06, $07, $0A, $07, $0A, $07, $0A, $07, $0A, $07, $0A
                       .DB $09, $08, $04, $03, $02, $01, $FF
;
L2351:
                       LD      A,(DE)              
                       AND     $08                 
                       RET     Z                   
                       LD      A,(HL)              
                       INC     L                   
                       LD      L,(HL)              
                       ADD     $08                 
                       LD      H,A                 
                       LD      A,(CounterB9)       ; 
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       ADD     A,L                 
                       AND     $1F                 
                       LD      B,A                 
                       LD      A,L                 
                       AND     $E0                 
                       OR      B                   
                       LD      L,A                 
                       LD      A,(HL)              
                       LD      B,A                 
                       AND     $FC                 
                       CP      $4C                 
                       JP      Z,L237B             ; 
                       AND     $F0                 
                       CP      $60                 
                       JP      Z,L2398             ; 
                       RET                         
;
L237B:
                       LD      A,(DE)              
                       AND     $F7                 
                       LD      (DE),A              
                       LD      A,$FF               
                       LD      (M4366),A           ; 
                       LD      A,B                 
                       DEC     A                   
                       LD      (HL),A              
                       CP      $4B                 
                       RET     NZ                  
                       LD      (HL),$00            
                       DEC     L                   
                       LD      A,(HL)              
                       CP      $5E                 
                       RET     NZ                  
                       LD      (HL),$4F            
                       RET                         

                       .ORG $2398
;
L2398:
                       LD      A,(DE)              
                       AND     $F7                 
                       LD      (DE),A              
                       INC     E                   
                       INC     E                   
                       LD      A,(DE)              
                       AND     $04                 
                       LD      A,B                 
                       JP      NZ,L2030            ; 
                       AND     $0C                 
                       CP      $04                 
                       LD      DE,$1B40            
L23AC:
                       JP      Z,L23C0             ; 
                       LD      A,B                 
                       AND     $0F                 
                       ADD     A,E                 
                       LD      E,A                 
                       LD      A,(DE)              
                       LD      (HL),A              
                       LD      A,$FF               
                       LD      (M4366),A           ; 
                       RET                         

                       .ORG $23C0
L23C0:
                       DEC     L                   
                       LD      A,(HL)              
                       AND     $F0                 
                       CP      $70                 
                       RET     NZ                  
                       LD      HL,GameState        ; Next interval game state ...
                       LD      (HL),$06            ; ... is 6 (mother ship partikel explosion)
                       INC     L                   
                       LD      (HL),$60            
                       LD      L,$63               
                       LD      (HL),$FF            
                       RET                         

                       .ORG $23D6
;
L23D6:
                       LD      HL,LevelAndRound    ; 
                       LD      A,(HL)              ;
                       AND     $0F                 ; mask out 0000_1111
                       CP      $01                 ;
                       JP      Z,L3A98             ; if game level is 1 (1st alien wave)
                       CP      $03                 ;
                       JP      Z,L3A98             ; if game level is 3 (2nd alien wave)
                       CP      $05                 ;
                       JP      Z,L3AD0             ; if game level is 5 (1st bird wave)
                       CP      $07                 ;
                       JP      Z,L3AD0             ; if game level is 7 (2nd bird wave)
                       CP      $09                 ;
                       RET     C                   ; if game level is 9 (mothership 'fade in')
                       CP      $0B                 ;
                       JP      C,L3B02             ; if game level is B (mothership)
                       CALL    L3B02               ; 
                       JP      L3A98               ; 

                       .ORG $2400
;*****************************************************************************
;* Game state 6.
;* Mother ship partikel explosion.
;*****************************************************************************
L2400:
                       CALL    L242C               ; 
                       JP      Z,L2552             ; 
                       CP      $20                 
                       JP      C,EraseMothership   ; 
                       JP      Z,L2520             ; Calculation and display of the bonus score for mothership explosion
                       LD      B,A                 
                       RRCA                        
                       NOP                         
                       LD      A,B                 
                       JP      NC,L20E8            ; 
                       LD      A,E                 
                       SUB     $05                 
                       ADD     $C0                 
                       LD      C,A                 
                       LD      A,D                 
                       ADC     $00                 
                       LD      B,A                 
                       LD      A,(HL)              
                       LD      DE,T2A00            ; get the foreground tiles of the mothership particles explosion
                       LD      HL,T2B00            ; get the control data
                       JP      L2085               ; 

                       .ORG $242C
;
L242C:
                       LD      HL,CounterB9        ; 
                       LD      A,(HL)              
                       AND     $F8                 
                       LD      (HL),A              
                       LD      (scrollRegister),A  ; 58xx scroll register
                       LD      DE,$41C6            
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       LD      B,A                 
                       LD      A,E                 
                       SUB     B                   
                       AND     $1F                 
                       LD      B,A                 
                       LD      A,E                 
                       AND     $E0                 
                       OR      B                   
                       LD      E,A                 
                       LD      L,$A5               
                       DEC     (HL)                
                       LD      A,(HL)              
                       RET                         

;*****************************************************************************
;* Game state 7.
;* Mother ship score display.
;*****************************************************************************
L244C:
                       LD      HL,CounterA5        ; 
                       DEC     (HL)                ;
                       LD      A,(HL)              ;
                       RRCA                        ;
                       JP      C,L06F0             ; update scroll register and fill background
                       AND     A                   ; updates the zero flag
                       RET     NZ                  ;
                       DEC     L                   ;
                       LD      (HL),$02            ;
                       LD      L,$B8               ;
                       LD      A,(HL)              ;
                       AND     $F0                 ;
                       ADD     $10                 ; go to next round and ..
                       LD      (HL),A              ; .. store at LevelAndRound $43B8
                       LD      L,$BA               ;
                       LD      (HL),$10            ; set AliensLeft to 16
                       JP      ClearForeground     ; 

                       .ORG $246A
;
EraseMothership:
                       LD      BC,$0914            ; 20x9 image
                       LD      DE,$4AC6            ; Screen coordinate of mother ship
                       LD      HL,$1C00            ; Background stars to erase the mother ship
                       JP      DrawImageCbyB       ; Erase the mother ship
;
L2476:
                       LD      A,B                 
                       ADD     A,C                 
                       CALL    L2495               ; 
                       LD      L,$D3               
                       LD      (HL),A              
                       LD      HL,BirdsLeft        ; 
                       LD      A,$08               ; number of birds
                       SUB     (HL)                ;
                       RLCA                        ; Multiply by 2
                       LD      L,$9A               
                       ADD     A,(HL)              
                       RLCA                        ; Multiply by 2
                       LD      B,A                 
                       LD      L,$6F               
                       LD      A,(HL)              
                       AND     $1E                 
                       ADD     A,B                 
                       LD      (M4BD1),A           ; 
                       RET                         

                       .ORG $2495
;
L2495:
                       ADD     A,B                 
                       DEC     C                   
                       RET     Z                   
                       ADD     A,B                 
                       DEC     C                   
                       RET     Z                   
                       ADD     A,B                 
                       DEC     C                   
                       RET     Z                   
                       ADD     A,A                 
                       RET                         
;
L24A0:
                       LD      A,(LevelAndRound)   ; 
                       AND     $0F                 ; mask out 0000_1111
                       CP      $08                 ;
                       RET     C                   ; return if game level < 8
                       LD      DE,PlayerBulletState
                       LD      HL,AbovePlayerBulletMSB
                       CALL    L2351               ; 
                       LD      A,(Counter9A+$1)    ; 
                       AND     $03                 ; mask out 0000_0011
                       CP      $03                 ;
                       RET     NZ                  ; return if <> 3
                       JP      L24F2               ; 

                       .ORG $24C4
;
L24C4:
                       LD      A,(LevelAndRound)   ; 
                       AND     $0F                 ; mask out 0000_1111
                       CP      $08                 ;
                       JP      C,L06F0             ; update scroll register and fill background if game level < 8
                       CALL    L24E0               ; 
                       LD      HL,M43AA            ; 
                       INC     (HL)                ;
                       LD      A,(HL)              ;
                       AND     $03                 ; mask out 0000_0011
                       JP      Z,L22FA             ; if $43AA <> 3
                       JP      L2322               ; Animation of the mothership's antenna and the alien pilot

                       .ORG $24E0
;
L24E0:
                       LD      A,(M43AA)           ; 
                       AND     $0F                 
                       RET     NZ                  
                       LD      A,(CounterB9)       ; 
                       CP      $A0                 
                       RET     C                   
                       JP      StarsScrollDown     ; 

                       .ORG $24F2
;
L24F2:
                       CALL    GetRandomNumber     ; 
                       ADD     $60                 
                       NOP                         
                       LD      B,A                 
                       LD      HL,Counter9A+$1    ; 
                       AND     $0E                 
                       AND     (HL)                
                       RET     NZ                  
                       LD      A,(M439E)           ; 
                       CP      B                   
                       RET     NC                  
                       LD      A,(M439F)           ; 
                       CP      B                   
                       RET     C                   
                       LD      A,B                 
                       SUB     $04                 
                       LD      B,A                 
                       LD      A,(CounterB9)       ; 
                       CPL                         
                       INC     A                   
                       AND     $F8                 
                       ADD     $48                 
                       LD      C,A                 
                       PUSH    HL                  
                       PUSH    HL                  
                       JP      L25B7               ; 

                       .ORG $2520
;*****************************************************************************
;* The 'alien pilot' at mothership was hit.
;* Calculation and display of the bonus score for mothership explosion.
;*****************************************************************************
L2520:
                       PUSH    DE                  ;
                       CALL    ClearForeground     ; remove all but the rest of the mothership
                       POP     DE                  ;
                       LD      A,(CounterB9)       ; get value from 8 bit backwards counter
                       ADD     $60                 ; use it for a ...
                       RRCA                        ; ... score value
                       LD      B,A                 ; save it
                       LD      A,(LevelAndRound)   ; 
                       AND     $F0                 ; mask out 1111_0000 (bit4 - 7: game round)
                       ADD     A,B                 ; add score value
                       LD      B,$90               ;
                       JP      C,L253D             ; 
                       CP      $90                 ;
                       JP      NC,L253D            ; 
                       LD      B,A                 ;
L253D:
                       XOR     A                   ; A=0
                       LD      A,B                 ;
                       DAA                         ; adjust for BCD
                       LD      HL,M439D            ; 
                       LD      (HL),A              ; set value for fist two digits of BCD score
                       INC     L                   ;
                       LD      (HL),$00            ; last two digits of BCD score set to '00'
                       LD      A,E                 ; get LSB of screen ram...
                       SUB     $5E                 ; ...
                       LD      E,A                 ; ...
                       LD      B,$04               ; number of digits to print
                       JP      PrintNumber         ; score for mothership explosion

                       .ORG $2552
;
L2552:
                       LD      L,$A4               ;
                       LD      (HL),$07            
                       INC     L                   
                       LD      (HL),$40            
                       LD      L,$6B               
                       LD      (HL),$FF            
                       RET                         

                       .ORG $2560
L2560:
                       LD      HL,Counter93            ; 
                       LD      A,(HL)              
                       AND     $01                 
                       RLCA                        ; Multiply by 32 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       ADD     $70                 
                       LD      L,A                 
                       LD      H,$4B               
                       LD      E,$08               
                       LD      A,(M4357)           ; 
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       NOP                         
                       ADD     $AD                 
                       LD      D,A                 
                       LD      A,(M439F)           ; 
                       ADD     $03                 
                       LD      C,A                 
                       LD      A,(M439E)           ; 
                       SUB     $0A                 
                       LD      B,A                 
L2588:
                       PUSH    HL                  
                       CALL    L2596               ; 
                       POP     HL                  
                       LD      A,L                 
                       ADD     $04                 
                       LD      L,A                 
                       DEC     E                   
                       JP      NZ,L2588            ; 
                       RET                         
;
L2596:
                       LD      A,(HL)              
                       AND     $08                 
                       RET     Z                   
                       INC     L                   
                       LD      A,(HL)              
                       CP      $08                 
                       RET     Z                   
                       CP      $88                 
                       RET     NC                  
                       INC     L                   
                       LD      A,(HL)              
                       CP      B                   
                       RET     C                   
                       CP      C                   
                       RET     NC                  
                       INC     L                   
                       LD      A,(HL)              
                       CP      D                   
                       RET     NC                  
                       CP      $80                 
                       RET     C                   
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
                       NOP                         
                       LD      C,A                 
                       DEC     L                   
                       LD      B,(HL)              
L25B7:
                       LD      A,(LevelAndRound)   ; 
                       LD      D,$03               ;
                       CP      $10                 ; 0001_0000
                       JP      C,L25CA             ; if game round < 1
                       LD      D,$04               ;
                       CP      $20                 ; 0010_0000
                       JP      C,L25CA             ; if game round < 2
                       LD      D,$05               ;
L25CA:
                       LD      HL,AlienBullet0State
L25CD:
                       LD      A,(HL)              ;
                       AND     $08                 ; mask out 0000_1000
                       JP      Z,L25E0             ; 
                       LD      A,L                 
                       ADD     $04                 
                       LD      L,A                 
                       DEC     D                   
                       JP      NZ,L25CD            ; 
                       POP     HL                  
                       POP     HL                  
                       RET                         

                       .ORG $25E0
L25E0:
                       LD      A,B                 
                       ADD     $04                 
                       LD      B,A                 
                       LD      A,C                 
                       ADD     $0C                 
                       LD      C,A                 
                       LD      (HL),$08            
                       INC     L                   
                       LD      A,B                 
                       RRCA                        
                       AND     $03                 
                       LD      D,A                 
                       LD      A,C                 
                       AND     $04                 
                       ADD     A,D                 
                       ADD     $58                 
                       LD      (HL),A              
                       INC     L                   
                       LD      (HL),B              
                       INC     L                   
                       LD      (HL),C              
                       POP     HL                  
                       POP     HL                  
                       RET                         

                       .ORG $2600
;*****************************************************************************
;* Birds vertical movement update (with 58xx scroll register).
;*****************************************************************************
L2600:
                       NOP                         ; Old command removed or space for a future replace patch
                       NOP                         ; ..
                       NOP                         ; ..
                       NOP                         ; ..
                       NOP                         ; ..
                       LD      A,(CounterB9)       ; 
                       CPL                         
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       AND     $1F                 
                       LD      HL,M4BD2            ; 
                       LD      (HL),A              
                       INC     L                   
                       LD      A,(M4BD1)           ; 
                       CP      (HL)                
                       JP      C,L2650             ; 
                       LD      A,(M4BD5)           ; 
                       LD      D,A                 
                       AND     $03                 
                       LD      E,A                 
                       LD      A,(Counter9A+$1)    ; 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       AND     $0C                 
                       ADD     A,E                 
                       ADD     $D0                 
                       LD      L,A                 
                       LD      H,$3E               
                       LD      A,D                 
                       RRCA                        
                       RRCA                        
                       AND     $07                 
                       ADD     A,(HL)              
                       LD      D,A                 
                       LD      A,(CounterB9)       ; 
                       SUB     D                   
L2639:
                       LD      (CounterB9),A       ; 
                       LD      (scrollRegister),A  ; 58xx scroll register
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       JP      NC,L26D0            ; 
                       CALL    L2668               ; 
                       JP      L26AA               ; 

                       .ORG $2650
;
L2650:
                       INC     L                   ;
                       LD      A,(Counter9A+$1)    ; 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       AND     $0C                 
                       ADD     A,(HL)              
                       ADD     $D0                 
                       LD      L,A                 
                       LD      H,$3E               
                       LD      A,(CounterB9)       ; 
                       ADD     A,(HL)              
                       JP      L2639               ; 
                       JP      NC,L26AE            ; 

;
L2668:
                       LD      A,(M436E)           ; 
                       NOP                         
                       LD      B,A                 
                       LD      A,(Counter9A)       ; 
                       CP      $18                 
                       JP      C,L2676             ; 
                       INC     B                   
L2676:
                       CP      $10                 
                       JP      C,L267C             ; 
                       INC     B                   
L267C:
                       LD      A,(AliensLeft)      ; 
                       CP      $03                 
                       JP      NC,L2685            ; 
                       INC     B                   
L2685:
                       LD      A,(M4BD6)           ; 
                       ADD     $E0                 
                       LD      L,A                 
                       LD      H,$3E               
                       LD      A,B                 
                       CP      (HL)                
                       JP      C,L2693             ; 
                       LD      A,(HL)              
L2693:
                       LD      D,A                 
                       LD      A,(BirdsLeft)       ; 
                       CP      $04                 
                       JP      NC,L269D            ; 
                       INC     D                   
L269D:
                       CP      $02                 
                       JP      NC,L26A3            ; 
                       INC     D                   
L26A3:
                       LD      A,D                 
                       LD      (M4BD5),A           ; 
                       RET                         

                       .ORG $26AA
L26AA:
                       LD      HL,M4BD3            ; 
                       LD      A,(HL)              
L26AE:
                       DEC     (HL)                
                       AND     A                   ; updates the zero flag
                       RET     NZ                  
                       INC     (HL)                
                       LD      L,$D6               
                       LD      A,(HL)              
                       CP      $16                 
                       RET     NC                  
                       CP      $08                 
                       RET     C                   
                       INC     L                   
                       SUB     (HL)                
                       RLCA                        ; Multiply by 2
                       LD      B,A                 
                       LD      A,(M436F)           ; 
                       AND     $03                 
                       LD      L,$D4               
                       LD      (HL),A              
                       CPL                         
                       AND     $03                 
                       INC     A                   
                       LD      C,A                 
                       JP      L2476               ; 

                       .ORG $26D0
;
L26D0:
                       LD      HL,M4BA8            ; 
                       LD      BC,$0800            
                       LD      DE,$8000            
L26D9:
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       JP      Z,L26E5             ; 
                       LD      A,D                 
                       RLCA                        ; Multiply by 2
                       JP      NC,L26E4            ; 
                       LD      D,C                 
L26E4:
                       LD      E,C                 
L26E5:
                       INC     C                   
                       LD      A,L                 
                       SUB     B                   
                       LD      L,A                 
                       CP      $68                 
                       JP      NZ,L26D9            ; 
                       LD      A,(M4BD2)           ; 
                       ADD     A,D                 
                       ADD     A,E                 
                       AND     $1F                 
                       LD      (M4BD6),A           ; 
                       LD      A,E                 
                       SUB     D                   
                       LD      (M4BD7),A           ; 
                       RET                         

                       .ORG $2700
;*****************************************************************************
;* Handles the scoring, and the update of sound control HW.
;*****************************************************************************
UpdateScoresAndSound:
                       LD      HL,GameOrAttract    ; 
                       LD      A,(HL)              ; get it
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if GameOrAttract is 'Attract mode'.
                       INC     L                   ;
                       LD      A,(HL)              ; get GameAndDemoOrSplash
                       AND     $01                 ; mask out 0000_0001 'Game for player 2'
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       ADD     $83                 ;
                       LD      L,A                 ;
                       LD      A,$FF               ;
                       LD      (M4397),A           ; 
                       LD      DE,M4370            ; 
L2717:
                       CALL    L2748               ; add score values for all enemies hit.
                       INC     E                   ;
                       INC     E                   ;
                       INC     E                   ;
                       LD      A,E                 ;
                       CP      $80                 ; from $4370 to $4380
                       JP      NZ,L2717            ; 
                       LD      E,$9D               ;
                       LD      A,(GameState)       ; 
                       CP      $06                 ;
                       JP      NZ,L2739            ; 
                       LD      A,(DE)              ;
                       LD      B,A                 ;
                       LD      C,$00               ;
                       CALL    AddToScore          ; 
                       XOR     A                   ; A=0
                       LD      (DE),A              ;
                       LD      (M4397),A           ; 
L2739:
                       LD      A,(M4397)           ; 
                       AND     A                   ; updates the zero flag
                       CALL    Z,L2768             ; if $4397 is 0.
                       CALL    UpdateSoundControlHW
                       JP      L3A10               ; 

                       .ORG $2748
; Add score values for enemies hit.
L2748:
                       LD      A,(DE)              ; get $4370
                       INC     E                   ;
                       CP      $01                 ;
                       RET     NZ                  ; if not 1
                       LD      A,(DE)              ;
                       AND     A                   ; updates the zero flag
                       RET     Z                   ;
                       RRCA                        ; enemy has been hit
                       RRCA                        ;
                       RRCA                        ;
                       RRCA                        ;
                       LD      B,A                 ;
                       AND     $F0                 ;
                       LD      C,A                 ;
                       LD      A,B                 ;
                       AND     $0F                 ;
                       LD      B,A                 ;
                       CALL    AddToScore          ; 
                       XOR     A                   ; Clear A Reg.
                       LD      (DE),A              ; clear the temp. score storage and ...
                       LD      (M4397),A           ; ... the first two digits of BCD score value
                       RET                         ;

                       .ORG $2768
;
L2768:
                       PUSH    HL                  
                       LD      DE,$4261            ; end of the screen area of player 1 score
                       LD      B,$06               ; number of digits to print
                       LD      A,(GameAndDemoOrSplash)
                       AND     A                   ; updates the zero flag
                       JP      Z,$2778             ; if GameAndDemoOrSplash is 'Game and demo for player 1'
                       LD      DE,$4021            ; end of the screen area of player 2 score
                       CALL    PrintNumber         ; update the score on screen
                       POP     HL                  
                       LD      DE,M43BD            ; 
                       EX      DE,HL               
                       LD      A,(HL)              
                       INC     L                   
                       OR      (HL)                
                       RET     Z                   
                       INC     L                   
                       EX      DE,HL               
                       CALL    L0314               ; 
                       RET     NC                  
                       LD      A,(GameAndDemoOrSplash)
                       ADD     $90                 
                       LD      L,A                 
                       INC     (HL)                
                       CALL    UpdateLivesScreen   ; 
                       LD      A,$FF               
                       LD      (M436A),A           ; 
                       LD      L,$BE               
                       LD      A,(HL)              
                       LD      (HL),$00            
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       DEC     L                   
                       LD      (HL),A              
                       RET                         

                       .ORG $27A8
;*****************************************************************************
;* Update the sound control hardware registers
;*****************************************************************************
UpdateSoundControlHW:
                       LD      HL,SoundControlA    ; ..
                       LD      A,(HL)              ; .. to
                       LD      (SOUNDCTLA),A       ; 60xx sound A
                       INC     L                   ; SoundControlB ..
                       LD      A,(HL)              ; .. to
                       LD      (SOUNDCTLB),A       ; 68xx sound B
                       OR      $0F                 ; 0000_1111
                       LD      (HL),A              ;
                       DEC     L                   ;
                       LD      (HL),$0F            ;
                       RET                         ;

                       .ORG $27BD
;
L27BD:
                       LD      HL,ParticleExplosion
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       JP      NZ,L27E2            ; if player ship was hit.
                       LD      L,$61               
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       CP      $19                 
                       JP      NC,L27D8            ; 
                       DEC     (HL)                
                       LD      L,$8C               
                       LD      A,(HL)              
                       OR      $40                 
                       LD      (HL),A              
                       RET                         

                       .ORG $27D8
L27D8:
                       LD      (HL),$18            
                       LD      L,$8C               
                       LD      A,(HL)              
                       AND     $BF                 
                       LD      (HL),A              
                       RET                         

                       .ORG $27E2
L27E2:
                       CP      $40                 
                       JP      C,L27E9             ; 
                       LD      (HL),$40            
L27E9:
                       DEC     (HL)                
                       LD      L,$8C               
                       LD      (HL),$8F            
                       RET                         

                       .ORG $2800
;foreground tiles of the player ship particles explosion
T2800:
                       .DB $00, $32, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $42, $42
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $E1, $00, $00, $E2, $00, $00
                       .DB $32, $00, $00, $00, $00, $00, $00, $00, $00, $E0, $00, $00, $40, $00, $00, $C3
                       .DB $00, $00, $00, $00, $00, $00, $DF, $00, $00, $E2, $00, $00, $E0, $00, $E1, $00
                       .DB $00, $30, $00, $00, $00, $00, $DE, $00, $00, $00, $C2, $00, $40, $00, $E0, $00
                       .DB $00, $00, $00, $30, $00, $30, $00, $5A, $00, $00, $E1, $00, $40, $00, $E2, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $30, $C1, $3E, $00, $E0, $00, $40, $C2, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $5A, $C1, $3E, $C8, $D8, $00, $00
                       .DB $E0, $E1, $C2, $E2, $E0, $00, $E1, $00, $C2, $00, $E2, $CE, $CA, $DA, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $CF, $CF, $C3, $3F, $C2, $41, $E0, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $DE, $00, $3F, $00, $C2, $41, $00, $E1, $00
                       .DB $00, $00, $00, $00, $00, $3D, $DF, $3D, $00, $00, $E1, $00, $41, $00, $00, $C2
                       .DB $00, $00, $00, $3D, $00, $00, $00, $00, $00, $E0, $00, $00, $41, $00, $00, $E2
                       .DB $00, $00, $3D, $00, $00, $00, $00, $00, $E2, $00, $00, $00, $00, $4F, $00, $E0
                       .DB $00, $3B, $00, $00, $00, $00, $00, $00, $00, $C2, $00, $00, $00, $4F, $00, $00
                       .DB $00, $00, $3B, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $4D, $4D

;control data of the player ship particles explosion
T2900:
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00, $38
                       .DB $00, $34, $00, $28, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $00, $02, $00, $00
                       .DB $00, $01, $00, $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $00, $00, $80, $48, $00, $04
                       .DB $40, $08, $00, $50, $00, $00, $80, $10, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $10, $00, $00, $20, $44, $00, $00, $00, $02
                       .DB $10, $00, $00, $04, $00, $48, $20, $00, $00, $10, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $10, $00, $00, $00, $44, $08, $00, $00, $01, $00, $00
                       .DB $08, $00, $00, $02, $00, $00, $00, $84, $08, $00, $00, $20, $00, $00, $00, $00
                       .DB $00, $00, $00, $20, $00, $00, $00, $42, $02, $00, $80, $00, $00, $00, $00, $00
                       .DB $04, $00, $00, $01, $00, $00, $00, $00, $00, $82, $04, $00, $00, $20, $00, $00
                       .DB $00, $40, $00, $00, $01, $82, $00, $00, $40, $00, $00, $00, $00, $00, $00, $00
                       .DB $02, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $81, $02, $00, $00, $40
                       .DB $02, $80, $00, $04, $00, $00, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $01, $00, $00, $00, $00, $00, $40, $00, $00, $00, $00, $00, $00, $02, $04, $08

;foreground, $tiles of the mothership particles explosion
T2A00:
                       .DB $00, $00, $00, $00, $00, $00, $00, $D2, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $DE, $00, $5E, $E0, $00, $00, $E1, $00, $00, $00, $00
                       .DB $00, $00, $C1, $00, $00, $CF, $53, $E2, $00, $D2, $E0, $00, $00, $D0, $00, $00
                       .DB $00, $00, $00, $DE, $00, $CE, $53, $E1, $D1, $E3, $00, $E1, $D3, $00, $00, $00
                       .DB $00, $00, $CF, $C0, $DE, $DF, $53, $D3, $E2, $00, $E2, $D2, $00, $5E, $E2, $00
                       .DB $00, $00, $00, $CE, $C1, $C2, $DE, $D2, $E1, $E3, $D1, $00, $D2, $00, $00, $00
                       .DB $00, $00, $00, $00, $DF, $DE, $C2, $CF, $E0, $D0, $E2, $E1, $C2, $C3, $00, $00
                       .DB $DF, $DE, $CF, $CE, $DF, $DE, $CF, $C8, $D8, $5E, $CE, $00, $CF, $DE, $DF, $CE
                       .DB $E0, $E3, $E2, $E1, $00, $E0, $D1, $CA, $DA, $D1, $D2, $D3, $D0, $D1, $D2, $D3
                       .DB $00, $00, $00, $00, $E3, $D2, $CE, $D2, $E2, $E0, $D3, $D1, $D3, $00, $00, $00
                       .DB $00, $00, $00, $E2, $D3, $CF, $DF, $E1, $D0, $E3, $E1, $D2, $00, $00, $00, $00
                       .DB $00, $00, $E1, $D0, $DE, $00, $DE, $E2, $00, $D3, $53, $E2, $5E, $C1, $C0, $00
                       .DB $00, $00, $00, $DF, $00, $00, $CF, $5E, $D1, $D2, $00, $53, $E3, $00, $00, $00
                       .DB $00, $00, $CE, $00, $CF, $00, $CE, $D2, $D2, $00, $53, $00, $5E, $E0, $00, $00
                       .DB $00, $00, $00, $00, $00, $DE, $00, $E1, $D3, $00, $E2, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $00, $5E, $D0, $00, $00, $00, $00, $00, $00, $00

;control data of the mothership particles explosion
T2B00:
                       .DB $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $01, $40, $02, $80, $05
                       .DB $A0, $01, $40, $02, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $00, $00, $80, $00, $00, $01, $20, $04, $00, $01, $40, $12
                       .DB $48, $02, $80, $01, $20, $04, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00
                       .DB $00, $00, $00, $00, $80, $00, $00, $02, $10, $08, $00, $01, $80, $04, $A0, $21
                       .DB $84, $05, $20, $02, $80, $01, $10, $08, $00, $00, $00, $01, $00, $00, $00, $00
                       .DB $00, $00, $80, $00, $00, $04, $08, $10, $00, $01, $40, $00, $40, $0A, $10, $40
                       .DB $02, $08, $40, $00, $10, $04, $80, $02, $08, $10, $00, $00, $00, $01, $00, $00
                       .DB $80, $00, $00, $08, $04, $20, $00, $02, $20, $00, $20, $14, $00, $01, $08, $80
                       .DB $01, $10, $80, $02, $20, $00, $08, $04, $80, $02, $04, $20, $00, $00, $00, $01
                       .DB $01, $01, $01, $01, $01, $04, $20, $00, $10, $28, $80, $02, $04, $00, $00, $04
                       .DB $20, $20, $00, $04, $40, $01, $10, $00, $04, $08, $80, $04, $00, $00, $00, $00
                       .DB $00, $00, $00, $08, $20, $00, $88, $10, $00, $44, $00, $00, $00, $10, $02, $00
                       .DB $08, $40, $00, $00, $00, $08, $40, $00, $08, $01, $00, $10, $80, $04, $00, $00
                       .DB $00, $00, $20, $00, $84, $20, $00, $08, $00, $00, $00, $00, $00, $20, $01, $00
                       .DB $04, $80, $00, $00, $00, $00, $00, $10, $40, $00, $04, $01, $00, $00, $80, $00

; movement pattern table for aliens
; Pattern 18
T2C00:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $06, $06, $1E
                       .DB $03, $03, $1F, $05, $05, $1C, $04, $04, $04, $1D, $06, $06, $1A, $04, $04, $04
                       .DB $1B, $05, $05, $05, $05, $18, $1F, $07, $07, $07, $07, $07, $07, $07, $07, $07
                       .DB $00, $FF, $FF, $FF
; Pattern 19
T2C34:
                       .DB $05, $05, $1C, $04, $1D, $0A, $0A, $0A, $0A, $0A, $0A, $06
                       .DB $06, $1E, $03, $03, $1F, $05, $1C, $04, $04, $1D, $0A, $06, $06, $1E, $03, $03
                       .DB $1F, $05, $1C, $04, $04, $1D, $0A, $06, $06, $1E, $03, $03, $1F, $05, $1C, $04
                       .DB $04, $1D, $0A, $06, $1E, $03, $1F, $05, $1C, $04, $1D, $06, $1E, $03, $03, $03
                       .DB $03, $15, $16, $17, $01, $01, $05, $05, $01, $01, $05, $05, $01, $01, $05, $05
                       .DB $01, $01, $05, $05, $02, $02, $18, $07, $07, $07, $00, $FF, $FF, $FF, $FF, $FF
; Pattern 20
T2C90:
                       .DB $1C, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $1D
                       .DB $06, $06, $06, $06, $06, $06, $06, $1E, $03, $03, $03, $03, $03, $03, $1F, $05
                       .DB $05, $05, $05, $1C, $04, $04, $1D, $06, $09, $09, $09, $1E, $03, $07, $07, $08
                       .DB $08, $07, $07, $08, $07, $00, $FF, $FF
; Pattern 21
T2CC8:
                       .DB $05, $05, $05, $05, $1C, $04, $04, $04
                       .DB $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $1D, $09, $09, $09, $09
                       .DB $0A, $0A, $0A, $09, $0A, $0A, $06, $1E, $03, $03, $03, $1F, $05, $05, $18, $03
                       .DB $19, $06, $06, $1E, $03, $03, $1F, $05, $05, $05, $05, $05, $05, $05, $00, $FF
; Pattern 22
T2D00:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $06, $1E, $03, $03, $03, $03, $03, $03, $03, $03
                       .DB $03, $03, $03, $03, $03, $03, $1F, $05, $05, $1C, $04, $04, $04, $04, $04, $04
                       .DB $04, $04, $04, $04, $1D, $06, $06, $1E, $03, $03, $03, $03, $03, $03, $1F, $05
                       .DB $05, $05, $05, $05, $1C, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $1B
                       .DB $00, $FF, $FF, $FF
; Pattern 23
T2D44:
                       .DB $05, $05, $05, $18, $03, $03, $03, $03, $03, $03, $03, $03
                       .DB $03, $19, $06, $06, $1A, $04, $04, $1B, $05, $05, $18, $03, $03, $03, $03, $03
                       .DB $03, $03, $19, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $1A, $04, $04
                       .DB $1B, $05, $05, $1C, $04, $04, $1D, $06, $06, $1A, $04, $04, $1B, $05, $05, $05
                       .DB $05, $05, $05, $05, $00, $FF, $FF, $FF
; Pattern 24
T2D88:
                       .DB $1C, $04, $04, $1D, $06, $06, $09, $0A
                       .DB $0A, $09, $09, $09, $16, $17, $14, $03, $03, $03, $1F, $05, $05, $1C, $04, $04
                       .DB $1D, $06, $06, $1E, $03, $03, $03, $03, $07, $07, $08, $08, $07, $07, $05, $05
                       .DB $1C, $04, $04, $04, $04, $04, $04, $04, $1D, $1A, $04, $1B, $00, $FF, $FF, $FF
; Pattern 25
T2DC0:
                       .DB $14, $03, $03, $19, $06, $0A, $0A, $09, $09, $09, $0A, $12, $13, $10, $11, $12
                       .DB $13, $10, $11, $12, $13, $10, $04, $04, $04, $04, $1B, $05, $18, $03, $19, $06
                       .DB $1A, $04, $1B, $05, $18, $07, $07, $07, $08, $08, $07, $07, $07, $03, $03, $19
                       .DB $0D, $0E, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
; Pattern, 26
T2E00:
                       .DB $0B, $0C, $0D, $0E, $02, $02, $02, $02, $0B, $0C, $0D, $0E, $01, $01, $14, $15
                       .DB $16, $17, $01, $01, $05, $05, $05, $05, $02, $02, $02, $02, $00, $FF, $FF, $FF
; Pattern, 27
T2E20:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $0D, $0E, $02, $02, $02, $02, $02, $02, $02, $02
                       .DB $05, $05, $01, $05, $05, $01, $05, $05, $01, $05, $05, $01, $00, $FF, $FF, $FF
; Pattern, 28
T2E40:
                       .DB $0B, $0C, $0D, $0E, $01, $01, $01, $18, $03, $19, $06, $06, $1A, $04, $1B, $05
                       .DB $18, $03, $19, $06, $06, $1A, $04, $04, $04, $04, $04, $04, $04, $04, $04, $1B
                       .DB $05, $05, $05, $01, $01, $01, $01, $01, $00, $FF, $FF, $FF
; Pattern, 29
T2E6C:
                       .DB $0B, $0C, $0D, $0E
                       .DB $01, $01, $0B, $0C, $0D, $0E, $01, $01, $05, $05, $05, $05, $01, $01, $0B, $0C
                       .DB $0D, $0E, $01, $01, $07, $08, $08, $07, $08, $08, $08, $07, $00, $FF, $FF, $FF
; Pattern, 30
T2E90:
                       .DB $14, $15, $16, $17, $14, $15, $16, $17, $14, $03, $03, $03, $03, $03, $03, $03
                       .DB $03, $03, $03, $03, $03, $19, $09, $0A, $0A, $09, $09, $0A, $0A, $12, $13, $08
                       .DB $08, $07, $07, $08, $08, $08, $08, $04, $04, $04, $11, $12, $13, $10, $11, $12
                       .DB $13, $00, $FF, $FF
; Pattern, 31
T2EC4:
                       .DB $10, $11, $12, $13, $10, $11, $12, $13, $10, $04, $04, $04
                       .DB $04, $04, $04, $04, $04, $04, $0A, $0A, $0A, $09, $0A, $09, $0A, $09, $16, $17
                       .DB $14, $03, $03, $03, $07, $07, $07, $07, $03, $19, $06, $1A, $04, $1B, $05, $18
                       .DB $07, $07, $07, $07, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
; Pattern, 32
T2F00:
                       .DB $05, $1C, $04, $1D, $06, $06, $06, $06, $06, $09, $09, $09, $0A, $0A, $0A, $09
                       .DB $09, $16, $17, $14, $1F, $05, $18, $03, $19, $06, $1E, $03, $1F, $05, $18, $03
                       .DB $19, $06, $1E, $03, $1F, $05, $05, $1C, $08, $08, $08, $08, $08, $08, $08, $08
                       .DB $00, $FF, $FF, $FF
; Pattern, 33
T2F34:
                       .DB $05, $18, $03, $19, $06, $06, $06, $06, $0A, $0A, $09, $09
                       .DB $0A, $0A, $09, $0A, $0A, $12, $13, $10, $1B, $05, $1C, $04, $1D, $1E, $1F, $1C
                       .DB $04, $1D, $06, $1A, $04, $04, $1B, $05, $18, $07, $07, $07, $07, $08, $07, $07
                       .DB $07, $07, $00, $FF
; Pattern, 34
T2F64:
                       .DB $0B, $0C, $0D, $0E, $0B, $0C, $1E, $03, $19, $06, $1E, $03
                       .DB $19, $06, $1E, $03, $19, $06, $1E, $1F, $1C, $1D, $1E, $03, $03, $03, $1F, $05
                       .DB $18, $03, $19, $06, $1E, $03, $1F, $05, $08, $08, $08, $08, $08, $08, $08, $07
                       .DB $07, $08, $08, $08, $08, $08, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
; Pattern, 35
T2FA0:
                       .DB $05, $05, $18, $03, $03, $03, $03, $03, $03, $03, $03, $19, $06, $06, $06, $06
                       .DB $06, $06, $06, $1A, $04, $1B, $05, $18, $03, $03, $03, $03, $19, $06, $06, $06
                       .DB $1A, $04, $1B, $05, $18, $03, $03, $03, $03, $19, $06, $06, $06, $1A, $04, $1B
                       .DB $05, $18, $03, $03, $03, $03, $19, $06, $06, $06, $1A, $04, $1B, $05, $18, $03
                       .DB $03, $19, $06, $06, $1A, $11, $12, $13, $02, $02, $02, $05, $05, $02, $02, $02
                       .DB $05, $05, $02, $02, $02, $05, $1C, $08, $08, $07, $07, $08, $08, $08, $00, $FF

;
L3000:
                       LD      HL,Counter93        ; 
                       LD      A,(HL)              ; load and save ram value
                       INC     (HL)                ; increment Counter93
                       AND     $07                 ; masc out 0000_0111 the saved value in order to count from 0 to 7
                       LD      HL,T3018            ; base of jump table
                       RLCA                        ; Multiply by 2 to get a 2 byte offset
                       ADD     A,L                 ;
                       LD      L,A                 ;
                       LD      A,(HL)              ; get MSB from jump table
                       INC     HL                  ;
                       LD      L,(HL)              ; get LSB from jump table
                       LD      H,A                 ;
                       JP      (HL)                ; jump to the corresponding function
; from jump table T3018 if Counter93 is 7
L3012:
                       RET                         ;

                       .ORG $3018
;
T3018:
                       .MSFIRST
                       .DW L3264 ; if Counter93 is 0
                       .DW L3028 ; if Counter93 is 1
                       .DW L30BA ; if Counter93 is 2
                       .DW L3124 ; if Counter93 is 3
                       .DW L315A ; if Counter93 is 4
                       .DW L31B4 ; if Counter93 is 5
                       .DW L322C ; if Counter93 is 6
                       .DW L3012 ; if Counter93 is 7

; from jump table T3018 if Counter93 is 1
L3028:
                       LD      HL,M4357            ; 
                       LD      A,(HL)              
                       CP      $03                 
                       RET     NC                  ; if >= 3
                       LD      L,$50               
                       LD      A,(HL)              ; get $4350
                       CP      $04                 
                       RET     NC                  ; if >= 4
                       LD      L,$58               
                       LD      A,(HL)              ; get $4358
                       AND     A                   ; updates the zero flag
                       JP      Z,L305C             ; 
                       DEC     (HL)                ; $4358
                       RET     NZ                  
                       DEC     L                   
                       INC     (HL)                ; $4357
                       LD      L,$50               
                       LD      (HL),$04            ; set $4350
                       LD      L,$53               
                       LD      (HL),$10            ; set $4353
                       INC     L                   
                       LD      (HL),$50            ; set $4354
                       LD      L,$51               
                       LD      (HL),$2E            ; set $4351
                       INC     L                   
                       LD      (HL),$00            ; clear $4352
                       LD      A,(PlayerShipX)     ; 
                       RRCA                        
                       RET     C                   
                       LD      (HL),$40            ; set $4352
                       RET                         

                       .ORG $305C
;
L305C:
                       CALL    L3074               ; 
                       LD      HL,M4357            ; 
                       LD      A,(HL)              ; get $4357
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       NOP                         ;
                       NOP                         ;
                       ADD     A,C                 ;
                       ADD     $07                 ;
                       LD      L,$58               ;
                       LD      (HL),A              ; store to $4358
                       RET                         ;

                       .ORG $3074
;
L3074:
                       LD      HL,LevelAndRound    ; 
                       LD      A,(HL)              
                       RRCA                        
                       NOP                         
                       AND     $07                 ; 0000_0111
                       LD      B,A                 
                       LD      A,$07               
                       SUB     B                   
                       LD      C,A                 
                       LD      A,(HL)              ; get LevelAndRound
                       CP      $80                 
                       JP      C,L3089             ; 
                       LD      A,$70               
L3089:
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       AND     $07                 
                       LD      B,A                 
                       LD      A,$07               
                       SUB     B                   
                       ADD     A,C                 
                       LD      C,A                 
                       LD      A,(AliensLeft)      ; 
                       SUB     $05                 
                       JP      NC,L309F            ; 
                       LD      A,$10               
L309F:
                       ADD     A,C                 
                       LD      C,A                 
                       CALL    GetRandomNumber     ; 
                       AND     $07                 
                       ADD     A,C                 
                       LD      C,A                 
                       RET                         

                       .ORG $30AA
;*****************************************************************************
;* Free running counter ($439B) and the X position of the player ship ($43C2)
;* is the base for a pseudo random number.
;* Returns A-register: $00 to $0F.
;*****************************************************************************
GetRandomNumber:
                       LD      HL,Counter9A+$1     ; 
                       LD      A,(HL)              ;
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       AND     $07                 ; mask out 0000_0111 in order to count from 0 to 7
                       LD      L,$C2               ; get $43C2 PlayerShipX
                       ADD     A,(HL)              ; add to counter value
                       AND     $0F                 ; mask out 0000_1111
                       RET                         ;

                       .ORG $30BA
; from jump table T3018 if Counter93 is 2
L30BA:
                       LD      HL,M4358            ; 
                       CALL    L30DA               ; for $4359
                       CALL    L30DA               ; for $435A
                       CALL    L30DA               ; for $435B
                       LD      L,$50               
                       LD      A,(HL)              ; get $4350
                       AND     A                   ; updates the zero flag
                       RET     NZ                  ; if <> 0
                       LD      L,$55               
                       LD      A,(HL)              ; get $4355
                       AND     A                   ; updates the zero flag
                       JP      Z,L30E4             ; if 0
                       DEC     (HL)                
                       RET     NZ                  
                       LD      L,$50               
                       LD      (HL),$01            
                       RET                         

                       .ORG $30DA
;
L30DA:
                       INC     L                   
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if 4359, 435A, 435B = 0
                       DEC     (HL)                
                       RET                         

                       .ORG $30E4
L30E4:
                       CALL    L3074               ; 
                       LD      HL,Counter9A        ; 
                       LD      A,(HL)              
                       CP      $10                 
                       JP      C,L30F2             ; 
                       LD      A,$0F               
L30F2:
                       LD      B,A                 
                       LD      A,$0F               
                       SUB     B                   
                       ADD     A,C                 
                       LD      C,A                 
                       LD      B,$01               
                       LD      L,$58               
                       CALL    L3112               ; for $4359
                       CALL    L3112               ; for $435A
                       CALL    L3112               ; for $435B
                       LD      A,C                 
                       RRCA                        
                       RRCA                        
                       AND     $3F                 ; 0011_1111
                       ADD     $01                 
                       LD      L,$55               
                       LD      (HL),A              ; set $4355
                       RET                         

                       .ORG $3112
;
L3112:
                       INC     L                   
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     NZ                  ; if <> 0
                       LD      A,C                 
                       RRCA                        
                       AND     $7F                 ; 0111_1111
                       LD      C,A                 
                       LD      A,B                 
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       DEC     B                   
                       LD      (HL),$0C            
                       RET                         

                       .ORG $3124
; from jump table T3018 if Counter93 is 3
L3124:
                       LD      HL,M4350            ; 
                       LD      A,(HL)              
                       CP      $01                 
                       RET     NZ                  ; if <> 1
                       LD      (HL),$02            ; set $4350
                       LD      L,$B8               
                       LD      A,(HL)              ; get LevelAndRound
                       RRCA                        
                       RRCA                        
                       AND     $0F                 
                       ADD     $05                 
                       CP      $11                 
                       JP      C,L313D             ; 
                       LD      A,$05               
L313D:
                       LD      L,$57               
                       SUB     (HL)                
                       LD      B,A                 
                       CALL    GetRandomNumber     ; 
                       INC     A                   
                       CP      B                   
                       JP      C,L314B             ; 
                       LD      A,$01               
L314B:
                       LD      L,$53               
                       LD      (HL),A              
                       RET                         

                       .ORG $315A
; from jump table T3018 if Counter93 is 4
L315A:
                       LD      HL,M4350            ; 
                       LD      A,(HL)              
                       CP      $02                 
                       RET     NZ                  ; if <> 2
                       CALL    GetRandomNumber     ; 
                       NOP                         
                       LD      B,A                 
                       RLCA                        ; Multiply by 2
                       ADD     $50                 
                       LD      L,A                 
                       LD      H,$4B               
                       LD      A,B                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ;
                       ADD     $70                 
                       LD      E,A                 
                       LD      D,$4B               
                       LD      C,$10               
                       LD      A,C                 
                       SUB     B                   
                       LD      B,A                 
L3179:
                       CALL    L3192               ; 
                       INC     DE                  
                       INC     DE                  
                       INC     DE                  
                       INC     DE                  
                       INC     HL                  
                       INC     HL                  
                       DEC     B                   
                       JP      NZ,L318A            ; 
                       LD      E,$70               
                       LD      L,$50               
L318A:
                       DEC     C                   
                       JP      NZ,L3179            ; 
                       RET                         

                       .ORG $3192
;
L3192:
                       LD      A,(DE)              
                       AND     $08                 
                       RET     Z                   
                       LD      A,(M4394)           ; 
                       CP      (HL)                
                       RET     NZ                  
                       LD      A,(M4356)           ; 
                       INC     L                   
                       LD      B,(HL)              
                       DEC     L                   
                       CP      B                   
                       RET     NZ                  
                       LD      A,L                 
                       LD      (M4354),A           ; 
                       LD      A,$03               
                       LD      (M4350),A           ; 
                       POP     HL                  
                       RET                         

                       .ORG $31B4
; from jump table T3018 if Counter93 is 5
L31B4:
                       LD      A,(M4350)           ; 
                       CP      $03                 
                       RET     NZ                  ; if <> 3
                       LD      A,(M4354)           ; 
                       SUB     $50                 
                       RLCA                        ; Multiply by 2
                       ADD     $72                 
                       LD      L,A                 
                       LD      H,$4B               
                       LD      B,(HL)              
                       INC     L                   
                       LD      D,(HL)              
                       LD      A,(PlayerShipX)     ; 
                       LD      C,$04               
                       CP      B                   
                       JP      NC,L31D6            ; 
                       LD      C,A                 
                       LD      A,B                 
                       LD      B,C                 
                       LD      C,$00               
L31D6:
                       SUB     B                   
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       AND     $07                 
                       ADD     $00                 ; LSB for table T3300
                       LD      L,A                 
                       LD      H,$33               ; get MSB for table T3300
                       LD      A,(HL)              
                       ADD     A,C                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       LD      C,A                 
                       NOP                         
                       NOP                         
                       NOP                         
                       LD      A,(M4357)           ; 
                       LD      B,A                 
                       CALL    L3210               ; 
                       LD      A,C                 
                       ADD     A,B                 
                       ADD     $10                 ; LSB for table T3310
                       LD      L,A                 
                       LD      H,$33               ; get MSB for table T3310
                       LD      C,(HL)              
                       CALL    GetRandomNumber     ; 
                       AND     $06                 
                       ADD     A,C                 
                       LD      L,A                 
                       LD      H,$33               ; get MSB for table T3330 (base adresses of closed loops pattern tables for aliens)
                       LD      A,(HL)              
                       INC     L                   
                       LD      B,(HL)              
                       LD      HL,M4350            ; 
                       LD      (HL),$05            
                       INC     L                   
                       LD      (HL),A              
                       INC     L                   
                       LD      (HL),B              
                       RET                         

                       .ORG $3210
;
L3210:
                       LD      A,(M4353)           ; 
                       CP      $01                 
                       RET     NZ                  ; if <> 1
                       LD      A,D                 
                       LD      B,$00               
                       CP      $58                 
                       RET     C                   
                       LD      B,$01               
                       CP      $78                 
                       RET     C                   
                       LD      B,$02               
                       CP      $98                 
                       RET     C                   
                       LD      B,$03               
                       RET                         

                       .ORG $322C
; from jump table T3018 if Counter93 is 6
L322C:
                       LD      A,(M4350)           ; 
                       CP      $04                 
                       RET     NZ                  ; if <> 4
                       LD      HL,M4B50            ; Pointer to alien movement pattern
                       LD      DE,M4B70            ; Alien data structure (grid)
                       LD      A,(M4356)           ; 
                       LD      C,A                 
                       LD      A,(M4394)           ; 
                       LD      B,A                 
L3240:
                       LD      A,(DE)              
                       AND     $08                 
                       JP      Z,L324E             ; 
                       LD      A,(HL)              
                       CP      B                   
                       RET     NZ                  
                       INC     L                   
                       LD      A,(HL)              
                       DEC     L                   
                       CP      C                   
                       RET     NZ                  
L324E:
                       INC     L                   
                       INC     L                   
                       LD      A,E                 
                       ADD     $04                 
                       LD      E,A                 
                       CP      $B0                 
                       JP      NZ,L3240            ; 
                       LD      A,$06               
                       LD      (M4350),A           ; 
                       RET                         

                       .ORG $3264
; from jump table T3018 if Counter93 is 0
L3264:
                       LD      HL,M4395            ; 
                       LD      A,(HL)              ;
                       LD      (M4356),A           ; 
                       INC     A                   
                       AND     $0F                 ; 0000_1111
                       LD      (HL),A              
                       LD      L,$50               
                       LD      A,(HL)              ; get $4350
                       CP      $05                 
                       RET     C                   ; if < 5
                       LD      (HL),$00            ; clear $4350
                       LD      L,$53               
                       LD      C,(HL)              ; get $4353
                       INC     L                   
                       LD      L,(HL)              ; get $4354
                       LD      H,$4B               
                       LD      A,(M4356)           ; 
                       LD      D,A                 
                       LD      A,(M4394)           ; 
                       LD      E,A                 
                       LD      A,L                 
                       SUB     $50                 
                       RRCA                        
                       LD      B,A                 
                       LD      A,$10               
                       SUB     B                   
                       LD      B,A                 
L328F:
                       LD      A,(HL)              
                       INC     L                   
                       CP      E                   
                       JP      NZ,L32A4            ; 
                       LD      A,(HL)              
                       CP      D                   
                       JP      NZ,L32A4            ; 
                       DEC     L                   
                       LD      A,(M4351)           ; 
                       LD      (HL),A              
                       INC     L                   
                       LD      A,(M4352)           ; 
                       LD      (HL),A              
L32A4:
                       INC     L                   
                       DEC     B                   
                       JP      NZ,L32AB            ; 
                       LD      L,$50               
L32AB:
                       DEC     C                   
                       JP      NZ,L328F            ; 
                       RET                         

;
L32B0:
                       LD      HL,M4350            ; 
                       LD      B,$30               ; 4350 to 437F
                       CALL    ClearBbytesAtHL     ; 
                       LD      L,$9A               ;
                       LD      B,$04               ; 439A to 439D
                       CALL    ClearBbytesAtHL     ; 
                       LD      A,(BirdsLeft)       ; 
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if no BirdsLeft
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       LD      C,A                 
                       LD      HL,M4B70            ; 
                       LD      B,$40               
                       CALL    ClearBbytesAtHL     ; 
                       LD      D,$4B               
                       LD      H,$3F               
                       LD      A,$40               
                       SUB     C                   
                       ADD     $70                 
                       LD      E,A                 
                       ADD     $10                 
                       LD      L,A                 
                       LD      B,C                 
                       LD      A,(LevelAndRound)   ; 
                       RRCA                        
                       RRCA                        
                       JP      NC,CopyBbytesHLtoDE ; 
                       LD      A,L                 
                       ADD     $40                 
                       LD      L,A                 
                       JP      CopyBbytesHLtoDE    ; 

                       .ORG $3300
;?
T3300:
                       .DB $00, $01, $02, $02, $03, $03, $03, $03
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
;?
T3310:
                       .DB $88, $90, $98, $A0, $68, $70, $78, $80, $48, $50, $58, $60, $48, $30, $38, $40
                       .DB $88, $90, $98, $A0, $A8, $B0, $B8, $C0, $C8, $D0, $D8, $E0, $C8, $E8, $F0, $F8

; Base adresses of closed loops pattern tables for aliens.
; T1130, T2C00, T2FA0...
T3330:
                       .MSFIRST
                       .DW T1130, T2C00, T2FA0, T2C00, T2EC4, T2FA0, T2F34, T2FA0
                       .DW T2CC8, T2EC4, T2E20, T2EC4, T1130, T139C, T13D0, T2C00
                       .DW T1130, T1328, T2C00, T2F34, T11A4, T2C90, T2F34, T2FA0
                       .DW T2C90, T2CC8, T2E20, T2EC4, T1160, T1354, T139C, T13D0
                       .DW T1020, T1064, T11A4, T1328, T1020, T11A4, T1200, T2F34
                       .DW T2C90, T2CC8, T2DC0, T2E20, T1160, T1244, T1288, T1354
                       .DW T1020, T1064, T1200, T1244, T1020, T1200, T1020, T1200
                       .DW T10A8, T2D88, T10A8, T2DC0, T11D0, T12CA, T1300, T1354
                       .DW T1020, T1064, T10D4, T1300, T1020, T10D4, T1200, T2F00
                       .DW T2D00, T2D44, T2D88, T2E6C, T1100, T11D0, T12CA, T2F64
                       .DW T1100, T1300, T2F64, T2F00, T10D4, T2D00, T2F00, T2C34
                       .DW T2D00, T2D44, T2E6C, T2E90, T1100, T2C34, T2F64, T2F64
                       .DW T2E90, T2F00, T2C34, T2C34, T2D44, T2E6C, T2E90, T2E90

;*****************************************************************************
;* Game level 7
;* birds level including 'fade in'
;*****************************************************************************
L3400:
                       CALL    PlayerUpdate        ; Updates the player ship, player bullet and the shield.
                       CALL    L3800               ; Collision detection for birds
                       CALL    L2600               ; birds vertical movement update (with 58xx scroll register)
                       CALL    L3800               ; Collision detection for birds
                       CALL    L3980               ; 
                       LD      A,(BirdsLeft)       ; 
                       AND     A                   ; updates the zero flag
                       JP      Z,L3462             ; if no BirdsLeft.
                       CP      $04                 ;
                       JP      NC,L3438            ; 
                       CALL    DrawFirst4BirdObjects ; including the horizontal movement update
                       CALL    DrawSecond4BirdObjects ; including the horizontal movement update
                       CALL    L3560               ; 
                       CALL    L3498               ; 
                       CALL    L34AA               ; 
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       JP      C,L0FC0             ; Handle animations for killed aliens
                       CALL    L3930               ; 
                       JP      L0C40               ; 

                       .ORG $3438
;
L3438:
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       JP      C,L3452             ; 
                       CALL    DrawFirst4BirdObjects
                       CALL    L3560               ; 
                       CALL    L3498               ; 
                       CALL    L3930               ; 
                       JP      L0C40               ; 

                       .ORG $3452
;
L3452:
                       CALL    DrawSecond4BirdObjects
                       CALL    L3560               ; 
                       CALL    L34AA               ; 
                       JP      L0FC0               ; Handle animations for killed aliens

                       .ORG $3462
;
L3462:
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       RET     C                   
                       CALL    L0C40               ; 
                       CALL    L0FC0               ; Handle animations for killed aliens
                       JP      L2204               ; 

                       .ORG $3474
;*****************************************************************************
;* Draw bird objects 0 to 3.
;* Including the horizontal movement update.
;*****************************************************************************
DrawFirst4BirdObjects:
                       LD      HL,B4B70            ; 
;
L3477:
                       PUSH    HL                  ;
                       CALL    DrawBirdObject      ; 
                       POP     HL                  ;
                       LD      A,L                 ;
                       ADD     $08                 ; go to next bird object
                       LD      L,A                 ;
                       CP      $90                 ; for bird0 to bird3
                       JP      NZ,L3477            ; 
                       RET                         ;

;*****************************************************************************
;* Draw bird objects 4 to 7.
;* Including the horizontal movement update.
;*****************************************************************************
DrawSecond4BirdObjects:
                       LD      HL,B4B90            ; 
;
L3489:
                       PUSH    HL                  ;
                       CALL    DrawBirdObject      ; 
                       POP     HL                  ;
                       LD      A,L                 ;
                       ADD     $08                 ; go to next bird object
                       LD      L,A                 ;
                       CP      $B0                 ; for bird4 to bird7
                       JP      NZ,L3489            ; 
                       RET                         ;

;
L3498:
                       LD      HL,B4B70            ; 
;
L349B:
                       PUSH    HL                  ;
                       CALL    L35B0               ; 
                       POP     HL                  ;
                       LD      A,L                 ;
                       ADD     $08                 ; go to next bird object
                       LD      L,A                 ;
                       CP      $90                 ; for bird 0 to bird3
                       JP      NZ,L349B            ; 
                       RET                         ;

;
L34AA:
                       LD      HL,B4B90            ; 
;
L34AD:
                       PUSH    HL                  ;
                       CALL    L35B0               ; 
                       POP     HL                  ;
                       LD      A,L                 ;
                       ADD     $08                 ; go to next bird object
                       LD      L,A                 ;
                       CP      $B0                 ; for bird4 to bird7
                       JP      NZ,L34AD            ; 
                       RET                         ;

                       .ORG $34C0
;*****************************************************************************
;* Draw a given bird object.
;* Input HL is the data structur of one bird object.
;* (For the 8 birds: $4B70, $4B78, $4B80, $4B88, $4B90, $4B98, $4BA0, $4BA8)
;*****************************************************************************
DrawBirdObject:
                       LD      A,(HL)              ; HL=$4B70 (or $4B78,...)
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if 0
                       LD      B,A                 ; save it
                       ADD     $C0                 ; add to base for table T3EC0
                       LD      E,A                 ; save it
                       LD      D,$3E               ; MSB for T3EC0
                       LD      A,(DE)              ; get data starting from $3EC1
                       LD      C,A                 ;
                       INC     L                   ;
                       LD      D,(HL)              ; get $4B71 MSB of screen ram
                       INC     L                   ;
                       LD      E,(HL)              ; get $4B72 LSB of screen ram
                       INC     L                   ;
                       LD      A,B                 ; restore it
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       ADD     A,(HL)              ; and add to $4B73 alien0 screen coordinate Y
                       AND     $7E                 ; mask out 0111_1110
                       LD      L,A                 ;
                       LD      H,$3E               ;
                       LD      A,(HL)              ; get MSB from address table for bird character block shapes (T3E08)
                       INC     L                   ;
                       LD      L,(HL)              ; get LSB
                       LD      H,A                 ;
L34DE:
                       LD      A,D                 ;
                       CP      $4B                 ; MSB of screen ram
                       JP      NZ,L350C            ; if value is not equal $4B
                       LD      A,E                 ;
                       CP      $50                 ;
                       JP      C,L350C             ; 
                       LD      B,$08               ;
                       INC     L                   ;
                       INC     L                   ;
                       SUB     $20                 ;
                       LD      E,A                 ;
                       CP      $50                 ;
                       JP      C,L3509             ; 
                       LD      B,$10               ;
                       INC     L                   ;
                       INC     L                   ;
                       SUB     $20                 ;
                       LD      E,A                 ;
                       CP      $50                 ;
                       JP      C,L3509             ; 
                       LD      B,$18               ;
                       INC     L                   ;
                       INC     L                   ;
                       SUB     $20                 ;
                       LD      E,A                 ;
;
L3509:
                       LD      A,C                 ;
                       ADD     A,B                 ;
                       LD      C,A                 ;
;
L350C:
                       LD      B,$35               ; MSB of return address for the draw shape entry.
                       PUSH    BC                  ;
                       LD      BC,$FFDF            ; Screen offset constant -33 right one column (-1), up one row (-32)
                       EX      DE,HL               ;
                       LD      (HL),$00            ; delete character on screen
                       INC     HL                  ;
                       LD      (HL),$00            ; delete character on screen
                       ADD     HL,BC               ;
                       RET                         ; jumps to draw shape entry.

                       .ORG $3520
;*****************************************************************************
;* Draw a shape.
;* Entry dep. on size of shape: 2x2,3x2,4x2,5x2,6x2,7x2.
;*****************************************************************************
Draw7x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw6x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw5x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw4x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw3x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw2x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
Draw1x2:
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       INC     HL                  ;
                       LD      A,(DE)              ;
                       LD      (HL),A              ;
                       INC     DE                  ;
                       ADD     HL,BC               ;
;
L3558:
                       LD      (HL),$00            ;
                       INC     HL                  ;
                       LD      (HL),$00            ;
                       RET                         ;

                       .ORG $3560
;
L3560:
                       CALL    GetRandomNumber     ; 
                       LD      B,A                 ;
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       LD      C,A                 ;
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       OR      B                   
                       LD      (M436F),A           ; 
                       LD      A,(LevelAndRound)   ; 
                       CP      $40                 ;
                       JP      C,L3577             ; if game round < 4
                       LD      A,$30               
L3577:
                       AND     $30                 
                       RRCA                        
                       LD      B,A                 
                       LD      A,(BirdsLeft)       ; 
                       DEC     A                   
                       CP      $04                 
                       JP      C,L3586             ; 
                       LD      A,$03               
L3586:
                       RLCA                        ; Multiply by 2
                       OR      B                   
                       LD      B,A                 
                       LD      A,(Counter9A)       ; 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       AND     $20                 ; mask out 0010_0000
                       OR      B                   
                       ADD     $80                 
                       LD      L,A                 
                       LD      H,$3E               
                       LD      A,(HL)              ; data from table T3E80
                       LD      (M436E),A           ; 
                       INC     L                   
                       LD      A,(HL)              ; data from table T3E80
                       ADD     A,C                 
                       AND     $F8                 
                       LD      (M436D),A           ; 
                       RET                         

                       .ORG $35B0
;
L35B0:
                       LD      A,(HL)              ; get index character block shape
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if index is 0
                       LD      B,A                 ; save index to B
                       INC     L                   ;
                       INC     L                   ;
                       INC     L                   ;
                       INC     L                   ;
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       JP      Z,L35BE             ; 
                       DEC     (HL)                ;
L35BE:
                       EX      DE,HL               ;
                       PUSH    DE                  ;
                       LD      A,B                 ; load index
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       LD      L,A                 ;
                       LD      H,$3F               ; MSB of table T3F00 for stack manipulation
                       LD      B,(HL)              ; get 1st byte
                       INC     HL                  ;
                       LD      C,(HL)              ; get 2nd byte
                       PUSH    BC                  ; to stack
                       INC     HL                  ;
                       LD      B,(HL)              ; get 3rd byte
                       INC     HL                  ;
                       LD      C,(HL)              ; get 4rd byte
                       PUSH    BC                  ; to stack
                       INC     HL                  ;
                       LD      B,(HL)              ; get MSB of 1st address
                       INC     HL                  ;
                       LD      C,(HL)              ; get LSB of 1st address
                       PUSH    BC                  ; to stack
                       INC     HL                  ;
                       LD      B,(HL)              ; get MSB of 2nd address
                       INC     HL                  ;
                       LD      C,(HL)              ; get LSB of 2nd address
                       PUSH    BC                  ; to stack
                       EX      DE,HL               ;
                       RET                         ; calls the 2nd address

                       .ORG $35E0
; called by $35B0
L35E0:
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       CP      $10                 
                       JP      NC,L3628            ; 
                       LD      B,A                 
                       DEC     L                   
                       ADD     A,(HL)              
                       LD      (HL),A              
                       DEC     L                   
                       DEC     L                   
                       LD      A,B                 
                       ADD     A,(HL)              
                       LD      (HL),A              
                       CP      $08                 
                       JP      C,L366A             ; 
                       AND     $07                 
                       LD      (HL),A              
                       DEC     L                   
                       LD      A,(HL)              
                       SUB     $20                 
                       LD      (HL),A              
                       JP      NC,L3604            ; 
                       DEC     L                   
                       DEC     (HL)                
                       INC     L                   
L3604:
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      C,(HL)              
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       DEC     L                   
                       LD      (HL),$10            
                       SUB     C                   
                       JP      Z,L3672             ; 
                       DEC     A                   
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       AND     $1F                 
                       CP      B                   
                       INC     A                   
                       LD      (HL),A              
                       RET     C                   
                       LD      A,(M436E)           ; 
                       LD      (HL),A              
                       CP      B                   
                       RET     Z                   
                       INC     B                   
                       LD      (HL),B              
                       RET                         

                       .ORG $3628
L3628:
                       AND     $0F                 
                       JP      Z,L3744             ; 
                       LD      B,A                 
                       DEC     L                   
                       LD      A,(HL)              
                       SUB     B                   
                       LD      (HL),A              
                       DEC     L                   
                       DEC     L                   
                       LD      A,(HL)              
                       SUB     B                   
                       LD      (HL),A              
                       JP      NC,L3695            ; 
                       AND     $07                 
                       LD      (HL),A              
                       DEC     L                   
                       LD      A,(HL)              
                       ADD     $20                 
                       LD      (HL),A              
                       JP      NC,L3648            ; 
                       DEC     L                   
                       INC     (HL)                
                       INC     L                   
L3648:
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       INC     L                   
                       INC     L                   
                       SUB     (HL)                
                       RRCA                        
                       RRCA                        
                       RRCA                        
                       AND     $1F                 
                       CP      B                   
                       INC     A                   
                       DEC     L                   
                       JP      C,L3663             ; 
                       LD      A,(M436E)           ; 
                       CP      B                   
                       JP      Z,L3663             ; 
                       LD      A,B                 
                       INC     A                   
L3663:
                       OR      $10                 
                       LD      (HL),A              
                       RET                         

                       .ORG $366A
;
L366A:
                       LD      A,B                 
                       AND     A                   ; updates the zero flag
                       RET     NZ                  
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     (HL)                
                       RET                         
;
L3672:
                       DEC     L                   
                       LD      B,(HL)              
                       INC     L                   
                       INC     L                   
                       LD      A,(PlayerShipX)     ; 
                       AND     $F8                 
                       CP      B                   
                       JP      NC,L3680            ; 
                       LD      B,A                 
L3680:
                       LD      A,(M436D)           ; 
                       LD      C,A                 
                       ADD     $08                 
                       LD      (M436D),A           ; 
                       LD      A,B                 
                       SUB     C                   
                       LD      (HL),$08            
                       RET     C                   
                       CP      $08                 
                       RET     C                   
                       LD      (HL),A              
                       RET                         

                       .ORG $3695
;
L3695:
                       INC     L                   
                       INC     L                   
                       LD      B,(HL)              
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       CP      B                   
                       RET     NZ                  
                       DEC     L                   
                       LD      (HL),$00            
                       INC     L                   
                       LD      A,(PlayerShipX)     ; 
                       AND     $F8                 
                       CP      B                   
                       JP      C,L36AB             ; 
                       LD      B,A                 
L36AB:
                       LD      A,(M436D)           ; 
                       ADD     $08                 
                       LD      (M436D),A           ; 
                       ADD     A,B                 
                       LD      (HL),$C8            
                       RET     C                   
                       CP      $C8                 
                       RET     NC                  
                       LD      (HL),A              
                       RET                         

                       .ORG $36C0
; called by $35B0
L36C0:
                       LD      A,(HL)              ;
                       RRCA                        ;
                       RET     C                   ;
                       DEC     L                   
                       LD      A,(HL)              
                       INC     A                   
                       AND     $07                 
                       LD      (HL),A              
                       RET                         

                       .ORG $36CC
; called by $35B0
L36CC:
                       POP     DE                  
                       POP     BC                  
                       POP     HL                  
                       RET                         

                       .ORG $36D2
; called by $35B0
L36D2:
                       POP     DE                  ;
                       POP     BC                  ;
                       POP     HL                  ;
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       RET     NZ                  ;
                       LD      (HL),B              
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),D              
                       LD      A,(M4368)           ; 
                       OR      $01                 
                       LD      (M4368),A           ; 
                       RET                         

                       .ORG $36EA
; called by $35B0
L36EA:
                       POP     DE                  
                       POP     BC                  
                       POP     HL                  
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     NZ                  
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       AND     $0F                 
                       RET     NZ                  
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),B              
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),D              
                       LD      A,(M4368)           ; 
                       OR      $02                 
                       LD      (M4368),A           ; 
                       RET                         

                       .ORG $370A
; called by $35B0
L370A:
                       POP     DE                  
                       POP     BC                  
                       POP     HL                  
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     NZ                  
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       AND     $0F                 
                       RET     NZ                  
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),B              
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),D              
                       LD      A,(M4368)           ; 
                       OR      $04                 
                       LD      (M4368),A           ; 
                       LD      A,(M436F)           ; 
                       AND     E                   
                       AND     $F0                 
                       RET     NZ                  
                       LD      A,E                 
                       AND     $0F                 
                       LD      (HL),A              
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      (HL),C              
                       LD      A,(M4368)           ; 
                       OR      $08                 
                       LD      (M4368),A           ; 
                       RET                         

                       .ORG $3744
L3744:
                       LD      (HL),$11            
                       DEC     L                   
                       DEC     (HL)                
                       DEC     L                   
                       DEC     L                   
                       LD      (HL),$07            
                       DEC     L                   
                       LD      A,(HL)              
                       ADD     $20                 
                       LD      (HL),A              
                       RET     NC                  
                       DEC     L                   
                       INC     (HL)                
                       RET                         

                       .ORG $3758
;
L3758:
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if 0
                       DEC     (HL)                
                       JP      Z,L37CC             ; 
                       LD      A,(HL)              
                       RRCA                        
                       JP      NC,L37B0            ; Prints the score value in the middle of the bonus explosion
                       LD      A,$0F               
                       SUB     (HL)                
                       AND     $0E                 ; mask out 0000_1110
                       RLCA                        ; Multiply by 16 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       INC     L                   
                       INC     L                   
                       LD      D,(HL)              
                       INC     L                   
                       LD      E,(HL)              
                       PUSH    AF                  
                       PUSH    DE                  
                       LD      BC,$FFDF            ; Screen offset constant -33 right one column (-1), up one row (-32)
                       CALL    L3796               ; left part of bonus explosion animation
                       POP     DE                  
                       POP     AF                  
                       CPL                         
                       LD      L,A                 
                       LD      H,$FF               
                       INC     HL                  
                       ADD     HL,DE               
                       EX      DE,HL               
                       LD      HL,$BFA0            
                       ADD     HL,DE               
                       RET     NC                  
                       EX      DE,HL               
                       LD      DE,T17D6            ; (Bonus explosion right part)
                       LD      (HL),$00            
                       INC     HL                  
                       LD      (HL),$00            
                       ADD     HL,BC               
                       JP      Draw3x2             ; 

                       .ORG $3796
;*****************************************************************************
;* Draws the left part of bonus explosion animation.
;*****************************************************************************
L3796:
                       ADD     $60                 
                       LD      L,A                 
                       LD      H,$00               
                       JP      NC,L379F            ; 
                       INC     H                   
L379F:
                       ADD     HL,DE               
                       EX      DE,HL               
                       LD      HL,$BCC0            
                       ADD     HL,DE               
                       RET     C                   
                       EX      DE,HL               
                       LD      DE,T17D0            ; (Bonus explosion left part)
                       JP      Draw3x2             ; 

                       .ORG $37B0
; Prints the score value in the middle of the bonus explosion animation.
; First two digits are from $4379. Last digit is ever 0.
L37B0:
                       INC     L                   ;
                       LD      A,(HL)              ;
                       DAA                         ;
                       LD      (HL),A              ;
                       INC     L                   ;
                       LD      D,(HL)              ;
                       INC     L                   ;
                       LD      E,(HL)              ;
                       DEC     L                   ;
                       DEC     L                   ;
                       NOP                         ;
                       CALL    RightOneColumn      ; 
                       LD      A,$20               ; character code for '0' (the right digit of bonus score)
                       LD      (DE),A              ; write to screen ram (upper left corner of object 17D6)
                       CALL    LeftOneColumn       ; 
                       LD      B,$02               ; for the left two digits
                       JP      PrintNumber         ; score value for bonus explosion

                       .ORG $37CC
;
L37CC:
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      A,(HL)              
                       AND     $1F                 
                       ADD     $20                 
                       LD      L,A                 
                       LD      H,$43               
                       LD      BC,$FFDF            ; Screen offset constant -33 right one column (-1), up one row (-32)
                       LD      DE,$001A            
L37DD:
                       LD      (HL),D              
                       INC     HL                  
                       LD      (HL),D              
                       ADD     HL,BC               
                       DEC     E                   
                       JP      NZ,L37DD            ; 
                       RET                         

                       .ORG $3800
;*****************************************************************************
;* Collision detection for birds.
;*****************************************************************************
L3800:
                       LD      A,(PlayerBulletState)
                       AND     $08                 
                       RET     Z                   
                       LD      A,(AbovePlayerBulletMSB)
                       ADD     $08                 
                       LD      D,A                 
                       LD      A,(M4BD2)           ; 
                       LD      E,A                 
                       LD      A,(AbovePlayerBulletLSB)
                       AND     $E0                 
                       LD      B,A                 
                       LD      A,(AbovePlayerBulletLSB)
                       SUB     E                   
                       NOP                         
                       AND     $1F                 
                       OR      B                   
                       LD      E,A                 
                       LD      A,(DE)              
                       SUB     $90                 
                       RET     C                   
                       LD      B,A                 
                       LD      A,(PlayerBulletX)   ; 
                       AND     $07                 
                       ADD     $00                 
                       LD      L,A                 
                       LD      H,$3E               
                       LD      C,(HL)              
                       LD      A,E                 
                       AND     $0E                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       LD      E,A                 
                       LD      A,$A8               
                       SUB     E                   
                       LD      E,A                 
                       LD      D,$4B               
                       LD      A,B                 
                       CP      $50                 
                       CALL    C,L3844             ; 
                       JP      L391C               ; 

; A bird has been hit
L3844:
                       ADD     $60                 ; LSB of table T3B60
                       LD      L,A                 
                       LD      H,$3B               ; MSB of table T3B60
                       LD      A,(HL)              
                       AND     C                   
                       RET     Z                   
                       CALL    L38A1               ; 
                       EX      DE,HL               
                       LD      A,(HL)              
                       LD      (HL),$00            
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       LD      D,(HL)              
                       POP     HL                  
                       LD      HL,BirdsLeft        ; 
                       DEC     (HL)                ; decrement number of BirdsLeft
                       CP      $0B                 
                       JP      C,L3894             ; 
                       LD      E,A                 
                       LD      A,$FF               ; set bonus explosion flag
                       LD      (M4369),A           ; 
                       LD      HL,M4378            ; 
                       LD      BC,$1010            ; C reg. set to: 'bonus explosion score 100'.
                       LD      A,E                 
                       CP      $0F                 
                       JP      Z,L38FB             ; 
                       LD      A,D                 
                       RRCA                        
                       AND     $7C                 
                       ADD     $30                 
                       LD      C,A                 
                       LD      A,E                 
                       CP      $0E                 
                       JP      Z,L38FB             ; 
                       LD      A,C                 
                       RRCA                        
                       LD      C,A                 
                       LD      A,E                 
                       CP      $0C                 
                       JP      NC,L38FB            ; 
                       LD      A,C                 
                       RRCA                        
                       LD      C,A                 
                       JP      L38FB               ; 

                       .ORG $3894
;
L3894:
                       LD      BC,$0D05            
                       LD      A,$FF               
                       LD      (M4364),A           ; 
                       JP      L38F8               ; 

                       .ORG $38A1
;
L38A1:
                       PUSH    DE                  
                       LD      C,$20               
                       EX      DE,HL               
                       INC     HL                  
                       LD      D,(HL)              
                       INC     HL                  
                       LD      E,(HL)              
; This is a simple protection against plagiarism !
; Changing this single letter will result in a disturbing graphics garbage,
; when you hit a bird.
                       LD      A,(L198C)           ; First letter 'R' from: " AMSTAR ELECTRONICS CORP. "
                       ADD     $DE                 ; 1101_1110
                       LD      L,A                 
                       LD      H,$17               ; HL=$17F0 (FourByFourEmpty:)
                       CALL    L34DE               ; 
                       POP     DE                  
                       RET                         

                       .ORG $38BC
;
L38BC:
                       ADD     $B0                 
                       LD      L,A                 
                       LD      H,$3B               
                       LD      A,(HL)              
                       AND     C                   
                       RET     Z                   
                       CALL    L38A1               ; 
                       LD      A,(DE)              
                       SUB     $0B                 
                       JP      C,L38E9             ; 
                       CP      $03                 
                       JP      NC,L38E9            ; 
                       LD      B,A                 
                       LD      H,D                 
                       LD      A,E                 
                       ADD     $05                 
                       LD      L,A                 
                       LD      A,(PlayerBulletX)   ; 
                       CP      (HL)                
                       RLA                         
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       AND     $04                 
                       OR      B                   
                       ADD     $B8                 
                       LD      L,A                 
                       LD      H,$3D               
                       LD      A,(HL)              
                       LD      (DE),A              
L38E9:
                       LD      A,$FF               
                       LD      (M4366),A           ; 
                       LD      BC,$0702            
                       JP      L38F8               ; 

                       .ORG $38F8
;
L38F8:
                       LD      HL,M4370            ; 
L38FB:
                       XOR     A                   ; A=0
                       CP      (HL)                
                       JP      Z,L3906             ; 
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       INC     L                   
                       CP      (HL)                
                       RET     NZ                  
L3906:
                       LD      (HL),B              
                       INC     L                   
                       LD      (HL),C              
                       INC     L                   
                       LD      A,(AbovePlayerBulletMSB)
                       LD      (HL),A              
                       INC     L                   
                       LD      A,(AbovePlayerBulletLSB)
                       LD      (HL),A              
                       LD      A,(PlayerBulletState)
                       AND     $F7                 
                       LD      (PlayerBulletState),A
                       RET                         
;
L391C:
                       LD      A,B                 
                       CP      $20                 
                       JP      NC,L38BC            ; 
                       RET                         
;
L3923:
                       RET     Z                   
                       DEC     (HL)                
                       LD      L,$8D               
                       LD      A,(HL)              
                       AND     $3F                 
                       OR      $80                 
                       LD      (HL),A              
                       RET                         

                       .ORG $3930
;
L3930:
                       LD      A,(M4BD2)           ; 
                       AND     $1E                 
                       ADD     T3DC0 & $FF         ; LSB of table T3DC0
                       LD      L,A                 
                       LD      H,T3DC0 >> 8        ; MSB of table T3DC0
                       LD      E,(HL)              
                       INC     L                   
                       LD      L,(HL)              
                       LD      H,$4B               
                       CALL    L3A00               ; 
                       LD      A,(M439F)           ; 
                       ADD     A,D                 
                       LD      C,A                 
                       LD      A,(M439E)           ; 
                       SUB     D                   
                       LD      B,A                 
L394C:
                       PUSH    HL                  
                       CALL    L395C               ; 
                       POP     HL                  
                       LD      A,L                 
                       ADD     $08                 
                       LD      L,A                 
                       DEC     E                   
                       JP      NZ,L394C            ; 
                       RET                         

                       .ORG $395C
;
L395C:
                       LD      A,(HL)              
                       CP      $05                 
                       RET     C                   
                       LD      A,L                 
                       ADD     $05                 
                       LD      L,A                 
                       LD      A,(HL)              
                       CP      B                   
                       RET     C                   
                       CP      C                   
                       RET     NC                  
                       SUB     $04                 
                       LD      B,A                 
                       DEC     L                   
                       DEC     L                   
                       DEC     L                   
                       LD      A,(M4BD2)           ; 
                       ADD     A,(HL)              
                       AND     $1F                 
                       RLCA                        ; Multiply by 8 ..
                       RLCA                        ; ..
                       RLCA                        ; ..
                       ADD     $08                 
                       LD      C,A                 
                       JP      L25B7               ; 

                       .ORG $3980
;
L3980:
                       LD      A,(M4BD2)           ; 
                       SUB     $0C                 
                       RET     C                   
                       CP      $10                 
                       RET     NC                  
                       LD      HL,PlayerBulletState
                       LD      DE,M4BC0            ; 
                       LD      B,$04               
                       CALL    CopyBbytesHLtoDE    ; 
                       LD      L,$E6               
                       LD      B,$02               
                       CALL    CopyBbytesHLtoDE    ; 
                       LD      L,$E2               
                       LD      DE,AbovePlayerBulletMSB
                       LD      B,$02               
                       CALL    CopyBbytesHLtoDE    ; 
                       LD      L,$C4               
                       LD      (HL),$08            
                       LD      DE,M439E            ; 
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       JP      C,L39BF             ; 
                       INC     E                   
                       LD      L,$E7               
                       LD      A,(HL)              
                       SUB     $20                 
                       LD      (HL),A              
                       DEC     L                   
                       LD      A,(HL)              
                       SBC     $00                 
                       LD      (HL),A              
L39BF:
                       LD      A,(DE)              
                       LD      (PlayerBulletX),A   ; 
L39C3:
                       CALL    L3800               ; Collision detection for birds
                       LD      HL,PlayerBulletState
                       LD      A,(HL)              
                       AND     $08                 
                       JP      Z,L39F0             ; 
                       LD      HL,AbovePlayerBulletLSB
                       INC     (HL)                
                       LD      A,(HL)              
                       AND     $1F                 
                       CP      $1D                 
                       JP      C,L39C3             ; 
L39DB:
                       LD      HL,M4BC0            ; 
                       LD      DE,PlayerBulletState
                       LD      B,$04               
                       CALL    CopyBbytesHLtoDE    ; 
                       LD      E,$E6               
                       LD      B,$02               
                       JP      CopyBbytesHLtoDE    ; 

                       .ORG $39F0
;
L39F0:
                       LD      L,$A6               
                       LD      A,(HL)              
                       CP      $C0                 
                       JP      C,L0CC4             ; 
                       SUB     $01                 
                       LD      (HL),A              
                       JP      L39DB               ; 

                       .ORG $3A00
;
L3A00:
                       LD      A,(BirdsLeft)       ; 
                       SUB     $0C                 
                       CPL                         
                       INC     A                   
                       LD      D,A                 
                       LD      A,(Counter9A+$1)    ; 
                       RRCA                        
                       RRCA                        
                       RET     C                   
                       POP     HL                  
                       RET                         
;
L3A10:
                       LD      HL,LevelAndRound    ; 
                       LD      A,(HL)              ; get it
                       AND     A                   ; updates the zero flag
                       JP      NZ,L3B43            ; if LevelAndRound is not 0.
                       LD      L,$8D               ; set SoundControlB for...
                       LD      (HL),$CF            ; ... 1100_1111 triggers Tune3 -- ESTUDIO (Phoenix theme song)
                       RET                         ;
;
L3A1D:
                       LD      HL,M4369            ; 
                       LD      A,(HL)              ;
                       AND     A                   ; updates the zero flag
                       JP      Z,L3A40             ; if $4369 is 0.
                       CP      $20                 
                       JP      C,L3A2C             ; 
                       LD      (HL),$20            
L3A2C:
                       DEC     (HL)                
                       LD      A,(HL)              
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       NOP                         
                       CPL                         
                       AND     $0E                 
                       LD      L,$8D               
                       LD      (HL),A              
                       LD      L,$68               
                       LD      (HL),$00            
                       LD      L,$66               
                       LD      (HL),$00            
                       RET                         
;
L3A40:
                       LD      L,$64               
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       JP      Z,L3A62             ; 
                       CP      $10                 
                       JP      C,L3A4E             ; 
                       LD      (HL),$10            
L3A4E:
                       DEC     (HL)                
                       LD      A,(HL)              
                       RRCA                        
                       NOP                         
                       NOP                         
                       CPL                         
                       AND     $07                 
                       OR      $10                 
                       LD      L,$8C               
                       LD      (HL),A              
                       LD      L,$66               
                       LD      (HL),$00            
                       RET                         

                       .ORG $3A62
;
L3A62:
                       LD      L,$66               
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       CP      $10                 
                       JP      C,L3A78             ; 
                       LD      (HL),$10            
                       LD      A,(LevelAndRound)   ; 
                       AND     $08                 
                       JP      Z,L3A78             ; 
                       LD      (HL),$05            
L3A78:
                       DEC     (HL)                
                       LD      L,$8C               
                       LD      A,(HL)              
                       AND     $08                 
                       OR      $04                 
                       LD      (HL),A              
                       RET                         
;
L3A82:
                       LD      HL,Counter9A        ; 
                       LD      A,(HL)              
                       CP      $03                 
                       RET     C                   
                       LD      L,$8D               
                       LD      A,(HL)              
                       AND     $3F                 
                       LD      (HL),A              
                       RET                         
;
L3A90:
                       LD      HL,M436B            ; 
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       JP      L3923               ; 
;
L3A98:
                       LD      HL,M4B70            ; 
                       LD      BC,$0800            
                       LD      DE,$03B0            
L3AA1:
                       LD      A,(HL)              
                       INC     L                   
                       AND     B                   
                       JP      Z,L3AAE             ; 
                       LD      A,(HL)              
                       CP      $28                 
                       JP      C,L3AAE             ; 
                       INC     C                   
L3AAE:
                       LD      A,L                 
                       ADD     A,D                 
                       LD      L,A                 
                       CP      E                   
                       JP      NZ,L3AA1            ; 
                       LD      A,C                 
                       AND     A                   ; updates the zero flag
                       RET     Z                   
                       CP      $08                 
                       JP      C,L3ABF             ; 
                       LD      A,$08               
L3ABF:
                       ADD     $25                 
                       LD      C,A                 
                       LD      HL,SoundControlA    ; 
                       LD      A,(HL)              
                       AND     $C0                 ; mask out 1100_0000
                       OR      C                   
                       LD      (HL),A              ; trigger sound control A
                       RET                         

                       .ORG $3AD0
;
L3AD0:
                       LD      HL,M438E            ; 
                       LD      A,(HL)              
                       AND     $01                 
                       RLCA                        ; Multiply by 4 ..
                       RLCA                        ; ..
                       OR      $20                 
                       LD      B,A                 
                       DEC     L                   
                       LD      A,(HL)              
                       AND     $C0                 
                       OR      B                   
                       LD      (HL),A              
                       LD      L,$96               
                       LD      A,(HL)              
                       INC     (HL)                
                       AND     A                   ; updates the zero flag
                       JP      Z,L3AF8             ; 
                       LD      A,(M4BD6)           ; 
                       ADD     $E0                 ; LSB of table T3DE0
                       LD      E,A                 
                       LD      D,$3D               ; MSB of table T3DE0
                       LD      A,(DE)              
                       CP      (HL)                
                       RET     NC                  
                       LD      (HL),$00            
                       RET                         

                       .ORG $3AF8
;
L3AF8:
                       LD      L,$8E               
                       INC     (HL)                
                       DEC     L                   
                       LD      A,(HL)              
                       OR      $10                 
                       LD      (HL),A              
                       RET                         

                       .ORG $3B02
;
L3B02:
                       LD      HL,Counter9A        ; 
                       LD      A,(HL)              
                       CP      $02                 
                       RET     NC                  
                       INC     L                   
                       LD      A,(HL)              
                       LD      B,A                 
                       AND     $60                 
                       LD      L,$8D               
                       LD      (HL),$0A            
                       RET     NZ                  
                       LD      A,B                 
                       AND     $02                 
                       ADD     $1C                 
                       LD      (HL),A              
                       RET                         

                       .ORG $3B1B
;
L3B1B:
                       LD      HL,M4362            ; 
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if $4362 is 0.
                       CP      $40                 
                       JP      C,L3B28             ; 
                       LD      (HL),$40            
L3B28:
                       DEC     (HL)                
                       LD      A,(HL)              
                       AND     $06                 
                       RLCA                        ; Multiply by 2
                       NOP                         
                       LD      L,$8D               
                       LD      (HL),A              
                       RET                         

                       .ORG $3B33
;
L3B33:
                       LD      HL,M436A            ; 
                       LD      A,(HL)              
                       AND     A                   ; updates the zero flag
                       RET     Z                   ; if $436A is 0.
                       DEC     (HL)                
                       AND     $08                 
                       OR      $07                 
                       LD      L,$8D               
                       LD      (HL),A              
                       RET                         

                       .ORG $3B43
;
L3B43:
                       LD      HL,GameState        ; 
                       LD      A,(HL)              ;
                       CP      $03                 ;
                       CALL    Z,L23D6             ; if GameState is 'normal game play'
                       CALL    L3B33               ; 
                       CALL    L3B1B               ; 
                       CALL    L3A1D               ; 
                       CALL    L27BD               ; 
                       CALL    L3A82               ; 
                       JP      L3A90               ; 

                       .ORG $3B60
;?
T3B60:
                       .DB $1F, $7C, $F0, $01, $C0
                       .DB $07, $7F, $FC, $F0, $07, $C0, $1F, $FF, $FC, $03, $F0
                       .DB $0F, $C0, $3F, $FC, $1F, $F0, $07, $FE, $3F, $F8, $0F, $FF, $FF, $FC, $1F, $FF
                       .DB $FC, $1F, $FC, $1F, $F0, $7F, $F0, $7F, $C0, $FF, $01, $C0, $FF, $01, $00, $FF
                       .DB $07, $00, $FF, $07, $FC, $1F, $FC, $1F, $F0, $7F, $F0, $7F, $C0, $FF, $01, $C0
                       .DB $FF, $01, $00, $FF, $07, $FF, $07, $FC, $1F, $F8, $0F, $F0, $C0, $03, $FF, $FF
                       .DB $03, $E0, $03, $E0, $0F, $80, $0F, $00, $3C, $00, $1E, $3F, $00, $FC, $F0, $00
                       .DB $7F, $FE, $00, $F0, $03, $E0, $00, $00, $0F, $80, $00, $00, $3F, $00, $FE, $30
                       .DB $00, $06, $FF, $00, $F8, $00, $00, $03, $E0, $00, $E0, $08, $20, $04, $C0, $01
                       .DB $E0, $03, $F8, $0F, $07, $E0, $3F, $03, $FF, $FF, $FF, $3F, $FC, $FF, $F8, $FF
                       .DB $FF, $07, $E0, $1F, $F0, $FF, $FC, $FF, $07, $1E, $FC, $1F, $1F, $7F, $FF, $FF
;bird character block shapes table (using character set B)
T3C00:
                       .DB $E8, $00, $E9, $00, $C4, $C6, $C5, $C7, $EA, $00, $EB, $00, $00, $00       ;bird shape #24 Object 3C00
                       .DB $EC, $00, $E9, $00, $C8, $CA, $C9, $CB, $EA, $00, $ED, $00, $00, $00       ;#28 Object 3C0E
                       .DB $EE, $00, $EF, $00, $CC, $CF, $CD, $D0, $CE, $D1, $F0, $00, $F1, $00       ;#29 Object 3C1C
                       .DB $F2, $00, $EF, $00, $D2, $00, $D3, $D5, $D4, $D6, $F0, $00, $F3, $00       ;#30 Object 3C2A
                       .DB $E8, $00, $E9, $00, $C4, $C6, $C5, $C7, $00, $00                   ;#24 without right wing Object 3C38
                       .DB $EC, $00, $E9, $00, $C8, $CA, $C9, $CB, $00, $00                   ;#28 without right wing Object 3C42
                       .DB $EE, $00, $EF, $00, $CC, $CF, $CD, $D0, $DD, $D1                   ;#29 without right wing and regrowing ($DD) Object 3C4C
                       .DB $F2, $00, $EF, $00, $D2, $00, $D3, $D5, $DD, $D6                   ;#30 without right wing and regrowing ($DD) Object 3C56
                       .DB $00, $00, $00, $00, $C4, $C6, $C5, $C7, $EA, $00, $EB, $00, $00, $00       ;#24 without left wing Object 3C60
                       .DB $00, $00, $00, $00, $DB, $CA, $C9, $CB, $EA, $00, $ED, $00, $00, $00       ;#28 without left wing and regrowing ($DB) Object 3C6E
                       .DB $00, $00, $00, $00, $DC, $CF, $CD, $D0, $CE, $D1, $F0, $00, $F1, $00       ;#29 without left wing and regrowing ($DC) Object 3C7C
                       .DB $00, $00, $00, $00, $00, $00, $D3, $D5, $D4, $D6, $F0, $00, $F3, $00       ;#30 without left wing Object 3C8A
                       .DB $00, $00, $00, $00, $C4, $C6, $C5, $C7, $00, $00                   ;#24 without left and right wing Object 3C98
                       .DB $00, $00, $00, $00, $DB, $CA, $C9, $CB, $00, $00                   ;#28 without left and right wing and regrowing ($DB) Object 3CA2
                       .DB $00, $00, $00, $00, $DC, $CF, $CD, $D0, $DD, $D1                   ;#29 without left and right wing and regrowing ($DC,$DD) Object 3CAC
                       .DB $00, $00, $00, $00, $00, $00, $D3, $D5, $DD, $D6                   ;#30 without left and right wing and regrowing ($DD) Object 3CB6
                       .DB $00, $00, $DE, $E2, $AB, $B2, $AC, $B3, $DF, $E3, $00, $00             ;#21 Object 3CC0
                       .DB $00, $00, $00, $E5, $B4, $B6, $B5, $B7, $E4, $E6, $00, $00             ;#25 Object 3CCC
                       .DB $00, $00, $00, $00, $B8, $BB, $B9, $BC, $BA, $BD, $00, $00             ;#26 Object 3CD8
                       .DB $00, $00, $00, $00, $BE, $C1, $BF, $C2, $C0, $C3, $00, $E7             ;#27 Object 3CE4
                       .DB $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ;not used
                       .DB $00, $00, $FA, $FC, $D7, $D9, $D8, $DA, $FB, $FD, $00, $00             ;#22 Object 3D00
                       .DB $F4, $F6, $F5, $00, $C4, $C6, $C5, $C7, $F7, $00, $F8, $F9             ;#23 Object 3D0C
                       .DB $00, $00, $00, $00, $A7, $A9, $A8, $AA, $00, $00                   ;#17 Object 3D18
                       .DB $00, $00, $00, $00, $AB, $AD, $AC, $AE, $00, $00                   ;#18 Object 3D22
                       .DB $00, $00, $DE, $00, $AB, $B0, $AC, $B1, $DF, $00                   ;#19 Object 3D2C
                       .DB $00, $00, $DE, $E0, $AB, $B2, $AC, $B3, $DF, $E1                   ;#20 Object 3D36
                       .DB $00, $00, $9D, $00, $9E, $00, $00, $00                         ;#12 Object 3D40
                       .DB $00, $00, $9F, $00, $A0, $00, $00, $00                         ;#13 Object 3D48
                       .DB $00, $00, $00, $00, $9C, $00, $00, $00                         ;#11 Object 3D50
                       .DB $00, $00, $00, $00, $A3, $A5, $A4, $A6                         ;#16 Object 3D58
                       .DB $00, $00, $9C, $00, $00, $00                               ;#11 one pos moved to the left Object 3D60
                       .DB $00, $00, $9D, $00, $9E, $00                               ;#12 (but 3x2) Object 3D66
                       .DB $00, $00, $9F, $00, $A0, $00                               ;#13 Object 3D6C
                       .DB $00, $00, $A1, $00, $A2, $00                               ;#14 Object 3D72
                       .DB $00, $00, $96, $00, $00, $00                               ;#7 Object 3D78
                       .DB $00, $00, $97, $00, $93, $00                               ;#8 Object 3D7E
                       .DB $00, $00, $98, $00, $99, $00                               ;#9 Object 3D84
                       .DB $00, $00, $9A, $00, $9B, $00                               ;#10 Object 3D8A
                       .DB $00, $00, $90, $00, $00, $00                               ;#3 Object 3D90
                       .DB $00, $00, $91, $00, $00, $00                               ;#4 Object 3D96
                       .DB $00, $00, $92, $00, $93, $00                               ;#5 Object 3D9C
                       .DB $00, $00, $94, $00, $95, $00                               ;#6 Object 3DA2
                       .DB $00, $00, $01, $00                                     ;like small star Object 3DA8
                       .DB $00, $00, $08, $00                                     ;like medium star Object 3DAC
                       .DB $00, $00, $0A, $00                                     ;like big star Object 3DB0
                       .DB $00, $00, $0B, $00, $0C, $0C, $0E, $FF                         ;group of stars Object 3DB4
                       .DB $0D, $0E, $0D, $FF                                     ;group of stars Object 3DBC

; ?
T3DC0:
                       .DB $06, $70
                       .DB $07, $70
                       .DB $08, $70
                       .DB $08, $70
                       .DB $08, $70
                       .DB $07, $78
                       .DB $06, $80
                       .DB $05, $88
                       .DB $04, $90
                       .DB $03, $98
                       .DB $02, $A0
                       .DB $01, $A8
                       .DB $02, $70
                       .DB $03, $70
                       .DB $04, $70
                       .DB $05, $70

; sinus motion like, y pos table used by big birds ?
T3DE0:
                       .DB $40, $40, $40, $40, $40, $40, $40, $34, $2C, $26, $20, $1C, $18, $14, $12, $0F
                       .DB $0D, $0B, $09, $08, $07, $06, $05, $04, $03, $02, $02, $02, $02, $02, $02, $02
                       .DB $01, $02, $04, $08, $10, $20, $40, $80

;address table for bird character block shapes (grouped by animation pattern)
T3E08:
                       .DB $3D, $A8 ;like small star                  2x2
                       .DB $3D, $AC ;like medium star                 2x2
                       .DB $3D, $B0 ;like big star                    2x2

                       .DB $3D, $B4 ;group of stars

;growing up
                       .DB $3D, $90 ;#3                               3x2
                       .DB $3D, $96 ;#4                               3x2
                       .DB $3D, $9C ;#5                               3x2
                       .DB $3D, $A2 ;#6                               3x2
                       .DB $3D, $78 ;#7                               3x2
                       .DB $3D, $7E ;#8                               3x2
                       .DB $3D, $84 ;#9                               3x2
                       .DB $3D, $8A ;#10                              3x2
                       .DB $3D, $60 ;#11 one pos moved to the left    3x2
                       .DB $3D, $66 ;#12 (but 3x2)                    3x2
                       .DB $3D, $6C ;#13                              3x2
                       .DB $3D, $72 ;#14                              3x2

                       .DB $3D, $40 ;#12                              4x2
                       .DB $3D, $48 ;#13                              4x2
                       .DB $3D, $50 ;#11                              4x2
                       .DB $3D, $58 ;#16                              4x2

                       .DB $3D, $18 ;#17                              5x2
                       .DB $3D, $22 ;#18                              5x2
                       .DB $3D, $2C ;#19                              5x2
                       .DB $3D, $36 ;#20                              5x2

                       .DB $3C, $C0 ;#21                              6x2
                       .DB $3D, $00 ;#22                              6x2
                       .DB $3D, $0C ;#23                              6x2

                       .DB $3C, $00 ;#24                              7x2

;get smaller and move to left
                       .DB $3D, $58 ;#16                              4x2
                       .DB $3D, $50 ;#11                              4x2
                       .DB $3D, $48 ;#13                              4x2
                       .DB $3D, $40 ;#12                              4x2

;get smaller
                       .DB $3D, $36 ;#20                              5x2
                       .DB $3D, $2C ;#19                              5x2
                       .DB $3D, $22 ;#18                              5x2
                       .DB $3D, $18 ;#17                              5x2

;wings going down
                       .DB $3C, $00 ;#24                              7x2
                       .DB $3D, $0C ;#23                              6x2
                       .DB $3D, $00 ;#22                              6x2
                       .DB $3C, $C0 ;#21                              6x2

;wings up and move to right
                       .DB $3C, $00 ;#24                              7x2
                       .DB $3C, $0E ;#28                              7x2
                       .DB $3C, $1C ;#29                              7x2
                       .DB $3C, $2A ;#30                              7x2

;wings up and move to right
                       .DB $3C, $38 ;#24 without right wing           5x2
                       .DB $3C, $42 ;#28 without right wing           5x2
                       .DB $3C, $4C ;#29 without right wing reg.      5x2
                       .DB $3C, $56 ;#30 without right wing reg.      5x2

;wings up and move to right
                       .DB $3C, $60 ;#24 without left wing            7x2
                       .DB $3C, $6E ;#28 without left wing reg.       7x2
                       .DB $3C, $7C ;#29 without left wing reg.       7x2
                       .DB $3C, $8A ;#30 without left wing            7x2

;wings up and move to right
                       .DB $3C, $98 ;#24 without left/right wing      5x2
                       .DB $3C, $A2 ;#28 without left/right wing reg  5x2
                       .DB $3C, $AC ;#29 without left/right wing reg  5x2
                       .DB $3C, $B6 ;#30 without left/right wing reg  5x2

;wings down and move to right
                       .DB $3C, $C0 ;#21                              6x2
                       .DB $3C, $CC ;#25                              6x2
                       .DB $3C, $D8 ;#26                              6x2
                       .DB $3C, $E4 ;#27                              6x2

;for birds
;copy to $436E,(+10) $436D
T3E80:
                       .DB $05, $40
                       .DB $05, $20
                       .DB $04, $30
                       .DB $04, $10
;not used?
                       .DB $06, $48
                       .DB $06, $28
                       .DB $05, $38
                       .DB $05, $18
;not used?
                       .DB $07, $50
                       .DB $07, $30
                       .DB $06, $40
                       .DB $06, $20
;not used?
                       .DB $08, $58
                       .DB $08, $38
                       .DB $07, $48
                       .DB $07, $28
;copy to $436E,(+10) $436D
                       .DB $06, $10
                       .DB $05, $20
                       .DB $05, $30
                       .DB $05, $40
;not used?
                       .DB $08, $18
                       .DB $07, $28
                       .DB $07, $38
                       .DB $06, $48
;not used?
                       .DB $08, $20
                       .DB $07, $30
                       .DB $07, $40
                       .DB $07, $50
;not used?
                       .DB $08, $30
                       .DB $08, $40
                       .DB $08, $50
                       .DB $08, $60

; LSB table for draw routine ($3520) entry.
; $3548, $3540, aso...
; for: 7x2, 7x3, 7x3, 7x3, 7x4, 7x5, 7x6, 7x4, 7x5, 7x6, 7x7, 7x5, 7x7, 7x5, 7x4.
T3EC0:
                       .DB $FF
                       .DB $48, $40, $40, $40, $38, $30, $28, $38, $30, $28, $20, $30, $20, $30, $28

;big birds related. offsets for movement ?
T3ED0:
                       .DB $01, $01, $01, $01
                       .DB $00, $00, $01, $01
                       .DB $00, $01, $01, $01
                       .DB $00, $00, $00, $01

                       .DB $05, $04, $03, $02, $01, $00
                       .DB $00, $00, $00, $00, $01, $01
                       .DB $01, $01, $02, $02
                       .DB $02, $02, $03, $03
                       .DB $03, $04, $04, $04
                       .DB $05, $05, $06, $06
                       .DB $07, $08, $07, $06

; Register contents and address for stack manipulation
; used at level 3,4,8,9.
T3F00:
                       .MSFIRST
; for bird index to character block shape (0)
                       .DB $FF, $FF, $FF, $FF   ; not used
                       .DB $FF, $FF         ; not used
                       .DB $FF, $FF,        ; not used
; for bird index to character block shape (1)
                       .DB $20, $FF, $02, $FF   ;BC and DE register contents
                       .DW L36D2         ;address to call
                       .DW L36C0         ;address to call
; for bird index to character block shape (2)
                       .DB $20, $FF, $03, $FF   ;
                       .DW L36D2         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (3)
                       .DB $30, $FF, $04, $FF   ;
                       .DW L36D2         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (4)
                       .DB $10, $FF, $05, $FF   ;
                       .DW L36EA         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (5)
                       .DB $10, $FF, $06, $FF   ;
                       .DW L36EA         ;address
                       .DW L36C0         ;address
; for bird index to character block shape (6)
                       .DB $10, $60, $07, $1F   ;
                       .DW L370A         ;address
                       .DW L36C0         ;address
; for bird index to character block shape (7)
                       .DB $F0, $10, $0B, $1A   ;
                       .DW L370A         ;address
                       .DW L36C0         ;address
; for bird index to character block shape (8)
                       .DB $40, $FF, $04, $FF   ;
                       .DW L36EA,        ;address
                       .DW L36C0         ;address
; for bird index to character block shape (9)
                       .DB $10, $FF, $08, $FF   ;
                       .DW L36EA         ;address
                       .DW L36C0         ;address
; for bird index to character block shape (A)
                       .DB $40, $10, $0F, $17   ;
                       .DW L370A         ;address
                       .DW L36C0         ;address
; for bird index to character block shape (B)
                       .DB $10, $FF, $0A, $FF   ;
                       .DW L36EA         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (C)
                       .DB $FF, $FF, $FF, $FF   ;
                       .DW L36CC         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (D)
                       .DB $FF, $FF, $FF, $FF   ;
                       .DW L36CC         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (E)
                       .DB $10, $FF, $06, $FF   ;
                       .DW L36EA         ;address
                       .DW L35E0         ;address
; for bird index to character block shape (F)
                       .DB $10, $10, $07, $79   ;
                       .DW L370A         ;address
                       .DW L35E0         ;address

;
;level 3 and 8 initial data for the 8 birds.
;data will be copied to $4B70-$4BAF
;..........................:index to first character block shape
;...............................:MSB of initial screen address
;....................................:LSB of the initial screen address
;.........................................:?
;..............................................:?
;...................................................:? grid coordinate x
;........................................................:?
;.............................................................:? grid coordinate y
T3F80:
                       .DB $01, $48, $EE, $00, $10, $B0, $10, $20       ; 0
                       .DB $01, $49, $2C, $00, $10, $A0, $00, $B0       ; 1
                       .DB $01, $49, $6A, $00, $10, $90, $00, $B8       ; 2
                       .DB $01, $49, $A8, $00, $10, $80, $00, $C0       ; 3
                       .DB $01, $49, $E6, $00, $10, $70, $00, $C8       ; 4
                       .DB $01, $4A, $24, $00, $10, $60, $00, $C8       ; 5
                       .DB $01, $4A, $62, $00, $10, $50, $00, $C8       ; 6
                       .DB $01, $4A, $A0, $00, $10, $40, $00, $C8       ; 7

;level 4 and 9 initial data for the 8 birds.
                       .DB $01, $4A, $CE, $00, $10, $38, $00, $B0       ; 0
                       .DB $01, $48, $CC, $00, $10, $B8, $10, $20       ; 1
                       .DB $01, $4A, $CA, $00, $10, $38, $00, $B8       ; 2
                       .DB $01, $48, $C8, $00, $10, $B8, $10, $18       ; 3
                       .DB $01, $4A, $C6, $00, $10, $38, $00, $C0       ; 4
                       .DB $01, $48, $C4, $00, $10, $B8, $10, $10       ; 5
                       .DB $01, $4A, $C2, $00, $10, $38, $00, $C8       ; 6
                       .DB $01, $48, $C0, $00, $10, $B8, $10, $08       ; 7
;********************************************************************
;* End                                                              *
;********************************************************************
.END