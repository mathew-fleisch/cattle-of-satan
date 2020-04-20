#!/bin/bash


# Cattle of Satan:
#       Resources: [Wh]eat, [Br]ick, [Sh]eep, [Or]e, [Wo]od, [De]sert 
#
# Vertices and edges are defined by a 12 x12  grid (A-K,01-12)
# Tiles are defined by the same grid, but only use 02,04,06,08,10,B,C,D,E,F,J
# Verticies (Possible settlements):
# .... .... .... .... .... VA06 VA07 .... .... .... .... ....
# .... .... .... VB04 VB05 .... .... VB08 VB09 .... .... ....
# .... VC02 VC03 .... .... VC06 VC07 .... .... VC10 VC11 ....
# VD01 .... .... VD04 VD05 .... .... VD08 VD09 .... .... VD12
# .... VE02 VE03 .... .... VE06 VE07 .... .... VE10 VE11 ....
# VF01 .... .... VF04 VF05 .... .... VF08 VF09 .... .... VF12
# .... VG02 VG03 .... .... VG06 VG07 .... .... VG10 VG11 ....
# VH01 .... .... VH04 VH05 .... .... VH08 VH09 .... .... VH12
# .... VI02 VI03 .... .... VI06 VI07 .... .... VI10 VI11 ....
# .... .... .... VJ04 VJ05 .... .... VJ08 VJ09 .... .... ....
# .... .... .... .... .... VK06 VK07 .... .... .... .... ....
#   
# Edges (Possible Roads):
# .... .... .... .... .... EA06 .... .... .... .... .... ....
# .... .... .... EB04 EB05 .... EB07 EB08 .... .... .... ....
# .... EC02 EC03 .... TEMP EC06 EC07 .... EC09 EC10 .... ....
# ED01 .... ED03 ED04 ED05 .... ED07 ED08 ED09 .... ED11 ....
# EE01 EE02 EE03 .... EE05 EE06 EE07 .... EE09 EE10 EE11 ....
# EF01 .... EF03 EF04 EF05 .... EF07 EF08 EF09 .... EF11 ....
# EG01 EG02 EG03 .... EG05 EG06 EG07 .... EG09 EG10 EG11 ....
# EH01 .... EH03 EH04 EH05 .... EH07 EH08 EH09 .... EH11 ....
# EI01 EI02 EI03 .... EI05 EI06 EI07 .... EI09 EI10 EI11 ....
# .... .... EJ03 EJ04 EJ05 .... EJ07 EJ08 EJ09 .... .... ....
# .... .... .... .... .... EK06 .... .... .... .... .... ....
#
# Tiles (Resources):
# .... .... .... .... .... .... .... .... .... .... .... ....
# .... .... .... .... .... TB06 .... .... .... .... .... ....
# .... .... .... TC04 .... .... .... TC08 .... .... .... ....
# .... TD02 .... .... .... TD06 .... .... .... TD10 .... ....
# .... .... .... TE04 .... .... .... TE08 .... .... .... ....
# .... TF02 .... .... .... TF06 .... .... .... TF10 .... ....
# .... .... .... TG04 .... .... .... TG08 .... .... .... ....
# .... TH02 .... .... .... TH06 .... .... .... TH10 .... ....
# .... .... .... TI04 .... .... .... TI08 .... .... .... ....
# .... .... .... .... .... TJ06 .... .... .... .... .... ....
# .... .... .... .... .... .... .... .... .... .... .... ....
#
# Ports:
# .... .... .... .... .... PA06 .... .... .... .... .... ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# .... .... PC03 .... .... .... .... .... PC09 .... .... ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# PF01 .... .... .... .... .... .... .... .... .... PF11 ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# PI01 .... .... .... .... .... .... .... .... .... PI11 ....
# .... .... .... .... .... .... .... .... .... .... .... ....
# .... .... .... PK04 .... .... .... PK08 .... .... .... ....
RED='\033[0;31m'
GREEN='\033[0;32m'
THAT='\033[0;34m'

NC='\033[0m' # No Color

VA06=$RED
VA07=$RED
VB04=$RED
VB05=$RED
VB08=$RED
VB09=$RED
VC02=$RED
VC03=$RED
VC06=$RED
VC07=$RED
VC10=$RED
VC11=$RED
VD01=$RED
VD04=$RED
VD05=$RED
VD08=$RED
VD09=$RED
VD12=$RED
VE02=$RED
VE03=$RED
VE06=$RED
VE07=$RED
VE10=$RED
VE11=$RED
VF01=$RED
VF04=$RED
VF05=$RED
VF08=$RED
VF09=$RED
VF12=$RED
VG02=$RED
VG03=$RED
VG06=$RED
VG07=$RED
VG10=$RED
VG11=$RED
VH01=$RED
VH04=$RED
VH05=$RED
VH08=$RED
VH09=$RED
VH12=$RED
VI02=$RED
VI03=$RED
VI06=$RED
VI07=$RED
VI10=$RED
VI11=$RED
VJ04=$RED
VJ05=$RED
VJ08=$RED
VJ09=$RED
VK06=$RED
VK07=$RED

EA06=$GREEN
EB04=$GREEN
EB05=$GREEN
EB07=$GREEN
EB08=$GREEN
EC02=$GREEN
EC03=$GREEN
EC05=$THAT
TEMP=$GREEN # REPLACE WITH EC04+1
EC06=$GREEN
EC07=$GREEN
EC09=$GREEN
EC10=$GREEN
ED01=$GREEN
ED03=$GREEN
ED04=$GREEN
ED05=$GREEN
ED07=$GREEN
ED08=$GREEN
ED09=$GREEN
ED11=$GREEN
EE01=$GREEN
EE02=$GREEN
EE03=$GREEN
EE05=$GREEN
EE06=$GREEN
EE07=$GREEN
EE09=$GREEN
EE10=$GREEN
EE11=$GREEN
EF01=$GREEN
EF03=$GREEN
EF04=$GREEN
EF05=$GREEN
EF07=$GREEN
EF08=$GREEN
EF09=$GREEN
EF11=$GREEN
EG01=$GREEN
EG02=$GREEN
EG03=$GREEN
EG05=$GREEN
EG06=$GREEN
EG07=$GREEN
EG09=$GREEN
EG10=$GREEN
EG11=$GREEN
EH01=$GREEN
EH03=$GREEN
EH04=$GREEN
EH05=$GREEN
EH07=$GREEN
EH08=$GREEN
EH09=$GREEN
EH11=$GREEN
EI01=$GREEN
EI02=$GREEN
EI03=$GREEN
EI05=$GREEN
EI06=$GREEN
EI07=$GREEN
EI09=$GREEN
EI10=$GREEN
EI11=$GREEN
EJ03=$GREEN
EJ04=$GREEN
EJ05=$GREEN
EJ07=$GREEN
EJ08=$GREEN
EJ09=$GREEN
EK06=$GREEN




printf "Would you like to play ${RED}Cattle of Satan${NC}?\n"
echo -e " ----------------------------------------------------------------"
echo -e " |                                                              |"
echo -e " |         |01 |02 |03 |04 |05 |06 |07 |08 |09 |10 |11 | 12     |"
echo -e " |         |   |   |   |   |   |P1 |   |   |   |   |   |        |"
echo -e " | A_______|___|___|___|___|__ ${VA06}.${NC}${EA06}___${NC}${VA07}.${NC} __|___|___|___|___|______A |"
echo -e " |         |   |   |   |   |  ${EB05}/${NC}     ${EB07}\\\\${NC}  |   |   |   |   |        |"
echo -e " |         |   |   |   |   | ${EB05}/${NC} ${TB06}XXXXX${NC} ${EB07}\\\\${NC} |   |   |   |   |        |"
echo -e " | B_______|___|___|_  ${VB04}.${NC}${EB04}___${NC}${VB05}.${NC}${EB05}/${NC}  ${TB06}YYYYY${NC}  ${EB07}\\\\${NC}${VB08}.${NC}${EB08}___${NC}${VB09}.${NC} __|___|___|______B |"
echo -e " |         |   |   |P ${EC03}/${NC}     ${TEMP}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC07}/${NC}     ${EC09}\\\\${NC} P|   |   |        |"
echo -e " |         |   |   |2${EC03}/${NC} ${TB06}XXXXX${NC} ${TEMP}\\\\${NC}       ${EC07}/${NC} ${TB06}XXXXX${NC} ${EC09}\\\\${NC}3|   |   |        |"
echo -e " | C_______|_  ${VC02}.${NC}${EC02}___${NC}${VC03}.${NC}${EC03}/${NC}  ${TB06}YYYYY${NC}  ${TEMP}\\\\${NC}${VC06}.${NC}${EC06}___${NC}${VC07}.${NC}${EC07}/${NC}  ${TB06}YYYYY${NC}  ${EC09}\\\\${NC}${VC10}.${NC}${EC10}___${NC}${VC11}.${NC} __|______C |"
echo -e " |         |  ${ED01}/${NC}     ${ED03}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${ED05}/${NC}     ${ED07}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${ED09}/${NC}     ${ED11}\\\\${NC}  |        |"
echo -e " |         | ${ED01}/${NC} ${TB06}XXXXX${NC} ${ED03}\\\\${NC}       ${ED05}/${NC} ${TB06}XXXXX${NC} ${ED07}\\\\${NC}       ${ED09}/${NC} ${TB06}XXXXX${NC} ${ED11}\\\\${NC} |        |"
echo -e " | D______ ${VD01}.${NC}${ED01}/${NC}  ${TB06}YYYYY${NC}  ${ED03}\\\\${NC}${VD04}.${NC}${ED04}___${NC}${VD05}.${NC}${ED05}/${NC}  ${TB06}YYYYY${NC}  ${ED07}\\\\${NC}${VD08}.${NC}${ED08}___${NC}${VD09}.${NC}${ED09}/${NC}  ${TB06}YYYYY${NC}  ${ED11}\\\\${NC}${VD12}.${NC}______D |"
echo -e " |         |${EE01}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}|        |"
echo -e " |         | ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} |        |"
echo -e " | E_______|_ ${EC05}\\\\${NC}${VE02}.${NC}${EC05}___${NC}${VE03}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VE06}.${NC}${EC05}___${NC}${VE07}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VE10}.${NC}${EC05}___${NC}${VE11}.${NC}${EC05}/${NC} _|______E |"
echo -e " |         |P ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC} P|        |"
echo -e " |         |4${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}5|        |"
echo -e " | F______ ${VF01}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VF04}.${NC}${EC05}___${NC}${VF05}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VF08}.${NC}${EC05}___${NC}${VF09}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VF12}.${NC}______F |"
echo -e " |         |${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}|        |"
echo -e " |         | ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} |        |"
echo -e " | G_______|_ ${EC05}\\\\${NC}${VG02}.${NC}${EC05}___${NC}${VG03}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VG06}.${NC}${EC05}___${NC}${VG07}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VG10}.${NC}${EC05}___${NC}${VG11}.${NC}${EC05}/${NC} _|______G |"
echo -e " |         |  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  |        |"
echo -e " |         | ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC} |        |"
echo -e " | H______ ${VH01}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VH04}.${NC}${EC05}___${NC}${VH05}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VH08}.${NC}${EC05}___${NC}${VH09}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VH12}.${NC}______H |"
echo -e " |         |${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}|        |"
echo -e " |         |P${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC}P|        |"
echo -e " | I_______|6 ${EC05}\\\\${NC}${VI02}.${NC}${EC05}___${NC}${VI03}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VI06}.${NC}${EC05}___${NC}${VI07}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VI10}.${NC}${EC05}___${NC}${VI11}.${NC}${EC05}/${NC} 7|______I |"
echo -e " |         |   |    ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}     ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}    |   |        |"
echo -e " |         |   |   | ${EC05}\\\\${NC}       ${EC05}/${NC} ${TB06}XXXXX${NC} ${EC05}\\\\${NC}       ${EC05}/${NC} |   |   |        |"
echo -e " | J_______|___|___|_ ${EC05}\\\\${NC}${VJ04}.${NC}${EC05}___${NC}${VJ05}.${NC}${EC05}/${NC}  ${TB06}YYYYY${NC}  ${EC05}\\\\${NC}${VJ08}.${NC}${EC05}___${NC}${VJ09}.${NC}${EC05}/${NC} _|___|___|______J |"
echo -e " |         |   |   |   |P8  ${EC05}\\\\${NC}  ${TB06}ZZZZZ${NC}  ${EC05}/${NC}  P9|   |   |   |        |"
echo -e " |         |   |   |   |   | ${EC05}\\\\${NC}       ${EC05}/${NC} |   |   |   |   |        |"
echo -e " | K_______|___|___|___|___|_ ${EC05}\\\\${NC}${VK06}.${NC}${EC05}___${NC}${VK07}.${NC}${EC05}/${NC} _|___|___|___|___|______K |"
echo -e " |         |   |   |   |   |   |   |   |   |   |   |   |        |"
echo -e " |         |01 |02 |03 |04 |05 |06 |07 |08 |09 |10 |11 |12      |"
echo -e " |                                                              |"
echo -e " ----------------------------------------------------------------"

echo -e "⚀ ⚁ ⚂ ⚃ ⚄ ⚅"
echo -e "🀙 🀚 🀛 🀜 🀝 🀞"