#!/bin/bash


# Cattle of Satan:
#       Resources: [Wh]eat, [Br]ick, [Sh]eep, [Or]e, [Wo]od, [De]sert 
## http://xahlee.info/comp/unicode_emoticons.html
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
# .... EC02 EC03 .... EC05 EC06 EC07 .... EC09 EC10 .... ....
# ED01 .... ED03 ED04 ED05 .... ED07 ED08 ED09 .... ED11 ....
# EE01 EE02 EE03 .... EE05 EE06 EE07 .... EE09 EE10 EE11 ....
# EF01 .... EF03 EF04 EF05 .... EF07 EF08 EF09 .... EF11 ....
# EG01 EG02 EG03 .... EG05 EG06 EG07 .... EG09 EG10 EG11 ....
# EH01 .... EH03 EH04 EH05 .... EH07 EH08 EH09 .... EH11 ....
# EI01 EI02 EI03 .... EI05 EI06 EI07 .... EI09 EI10 EI11 ....
# .... .... EJ03 EJ04 EJ05 .... EJ07 EJ08 EJ09 .... .... ....
# .... .... .... .... EK05 EK06 EK07 .... .... .... .... ....
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
source vars.sh
START_TIME=$(date +%s)


printf "Would you like to play ${RED}Cattle of Satan${NC}?\n"
# sleep 1

board() {
clear
CURRENT_VERTS=$(echo $VERTS | tr ' ' '\n' | wc -l | awk '{print $1}')
CURRENT_EDGES=$(echo $EDGES | tr ' ' '\n' | wc -l | awk '{print $1}')

CURRENT_VERTS=$(printf "%02d" $CURRENT_VERTS)
CURRENT_EDGES=$(printf "%02d" $CURRENT_EDGES)
CURRENT_TOTAL=$(printf "%06d" $TOTAL)
echo -e " --------------------------------------------------------------------------"
echo -e " |                                                          Verticies: $CURRENT_VERTS |"
echo -e " |         |01 |02 |03 |04 |05 |06 |07 |08 |09 |10 |11 | 12 Edges: $CURRENT_EDGES     |"
echo -e " |         |   |   |   |   |   |P1 |   |   |   |   |   |    Total: $CURRENT_TOTAL |"
echo -e " | A_______|___|___|___|___|__ ${CVA06}${VA06}${NC}${CEA06}${EA06}${NC}${CVA07}${VA07}${NC} __|___|___|___|___|______A           |"
echo -e " |         |   |   |   |   |  ${CEB05}${EB05}${NC}     ${CEB07}${EB07}${NC}  |   |   |   |   |                  |"
echo -e " |         |   |   |   |   | ${CEB05}${EB05}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEB07}${EB07}${NC} |   |   |   |   |                  |"
echo -e " | B_______|___|___|_  ${CVB04}${VB04}${NC}${CEB04}${EB04}${NC}${CVB05}${VB05}${NC}${CEB05}${EB05}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEB07}${EB07}${NC}${CVB08}${VB08}${NC}${CEB08}${EB08}${NC}${CVB09}${VB09}${NC} __|___|___|______B           |"
echo -e " |         |   |   |P ${CEC03}${EC03}${NC}     ${CEC05}${EC05}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEC07}${EC07}${NC}     ${CEC09}${EC09}${NC} P|   |   |                  |"
echo -e " |         |   |   |2${CEC03}${EC03}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEC05}${EC05}${NC}       ${CEC07}${EC07}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEC09}${EC09}${NC}3|   |   |                  |"
echo -e " | C_______|_  ${CVC02}${VC02}${NC}${CEC02}${EC02}${NC}${CVC03}${VC03}${NC}${CEC03}${EC03}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEC05}${EC05}${NC}${CVC06}${VC06}${NC}${CEC06}${EC06}${NC}${CVC07}${VC07}${NC}${CEC07}${EC07}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEC09}${EC09}${NC}${CVC10}${VC10}${NC}${CEC10}${EC10}${NC}${CVC11}${VC11}${NC} __|______C           |"
echo -e " |         |  ${CED01}${ED01}${NC}     ${CED03}${ED03}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CED05}${ED05}${NC}     ${CED07}${ED07}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CED09}${ED09}${NC}     ${CED11}${ED11}${NC}  |                  |"
echo -e " |         | ${CED01}${ED01}${NC} ${CTB06}${TB06}${NC}XXXXX ${CED03}${ED03}${NC}       ${CED05}${ED05}${NC} ${CTB06}${TB06}${NC}XXXXX ${CED07}${ED07}${NC}       ${CED09}${ED09}${NC} ${CTB06}${TB06}${NC}XXXXX ${CED11}${ED11}${NC} |                  |"
echo -e " | D______ ${CVD01}${VD01}${NC}${CED01}${ED01}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CED03}${ED03}${NC}${CVD04}${VD04}${NC}${CED04}${ED04}${NC}${CVD05}${VD05}${NC}${CED05}${ED05}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CED07}${ED07}${NC}${CVD08}${VD08}${NC}${CED08}${ED08}${NC}${CVD09}${VD09}${NC}${CED09}${ED09}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CED11}${ED11}${NC}${CVD12}${VD12}${NC}______D           |"
echo -e " |         |${CEE01}${EE01}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEE03}${EE03}${NC}     ${CEE05}${EE05}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEE07}${EE07}${NC}     ${CEE09}${EE09}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEE11}${EE11}${NC}|                  |"
echo -e " |         | ${CEE01}${EE01}${NC}       ${CEE03}${EE03}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEE05}${EE05}${NC}       ${CEE07}${EE07}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEE09}${EE09}${NC}       ${CEE11}${EE11}${NC} |                  |"
echo -e " | E_______|_ ${CEE01}${EE01}${NC}${CVE02}${VE02}${NC}${CEE02}${EE02}${NC}${CVE03}${VE03}${NC}${CEE03}${EE03}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEE05}${EE05}${NC}${CVE06}${VE06}${NC}${CEE06}${EE06}${NC}${CVE07}${VE07}${NC}${CEE07}${EE07}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEE09}${EE09}${NC}${CVE10}${VE10}${NC}${CEE10}${EE10}${NC}${CVE11}${VE11}${NC}${CEE11}${EE11}${NC} _|______E           |"
echo -e " |         |P ${CEF01}${EF01}${NC}     ${CEF03}${EF03}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEF05}${EF05}${NC}     ${CEF07}${EF07}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEF09}${EF09}${NC}     ${CEF11}${EF11}${NC} P|                  |"
echo -e " |         |4${CEF01}${EF01}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEF03}${EF03}${NC}       ${CEF05}${EF05}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEF07}${EF07}${NC}       ${CEF09}${EF09}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEF11}${EF11}${NC}5|                  |"
echo -e " | F______ ${CVF01}${VF01}${NC}${CEF01}${EF01}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEF03}${EF03}${NC}${CVF04}${VF04}${NC}${CEF04}${EF04}${NC}${CVF05}${VF05}${NC}${CEF05}${EF05}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEF07}${EF07}${NC}${CVF08}${VF08}${NC}${CEF08}${EF08}${NC}${CVF09}${VF09}${NC}${CEF09}${EF09}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEF11}${EF11}${NC}${CVF12}${VF12}${NC}______F           |"
echo -e " |         |${CEG01}${EG01}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEG03}${EG03}${NC}     ${CEG05}${EG05}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEG07}${EG07}${NC}     ${CEG09}${EG09}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEG11}${EG11}${NC}|                  |"
echo -e " |         | ${CEG01}${EG01}${NC}       ${CEG03}${EG03}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEG05}${EG05}${NC}       ${CEG07}${EG07}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEG09}${EG09}${NC}       ${CEG11}${EG11}${NC} |                  |"
echo -e " | G_______|_ ${CEG01}${EG01}${NC}${CVG02}${VG02}${NC}${CEG02}${EG02}${NC}${CVG03}${VG03}${NC}${CEG03}${EG03}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEG05}${EG05}${NC}${CVG06}${VG06}${NC}${CEG06}${EG06}${NC}${CVG07}${VG07}${NC}${CEG07}${EG07}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEG09}${EG09}${NC}${CVG10}${VG10}${NC}${CEG10}${EG10}${NC}${CVG11}${VG11}${NC}${CEG11}${EG11}${NC} _|______G           |"
echo -e " |         |  ${CEH01}${EH01}${NC}     ${CEH03}${EH03}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEH05}${EH05}${NC}     ${CEH07}${EH07}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEH09}${EH09}${NC}     ${CEH11}${EH11}${NC}  |                  |"
echo -e " |         | ${CEH01}${EH01}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEH03}${EH03}${NC}       ${CEH05}${EH05}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEH07}${EH07}${NC}       ${CEH09}${EH09}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEH11}${EH11}${NC} |                  |"
echo -e " | H______ ${CVH01}${VH01}${NC}${CEH01}${EH01}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEH03}${EH03}${NC}${CVH04}${VH04}${NC}${CEH04}${EH04}${NC}${CVH05}${VH05}${NC}${CEH05}${EH05}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEH07}${EH07}${NC}${CVH08}${VH08}${NC}${CEH08}${EH08}${NC}${CVH09}${VH09}${NC}${CEH09}${EH09}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEH11}${EH11}${NC}${CVH12}${VH12}${NC}______H           |"
echo -e " |         |${CEI01}${EI01}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEI03}${EI03}${NC}     ${CEI05}${EI05}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEI07}${EI07}${NC}     ${CEI09}${EI09}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEI11}${EI11}${NC}|                  |"
echo -e " |         |P${CEI01}${EI01}${NC}       ${CEI03}${EI03}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEI05}${EI05}${NC}       ${CEI07}${EI07}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEI09}${EI09}${NC}       ${CEI11}${EI11}${NC}P|                  |"
echo -e " | I_______|6 ${CEI01}${EI01}${NC}${CVI02}${VI02}${NC}${CEI02}${EI02}${NC}${CVI03}${VI03}${NC}${CEI03}${EI03}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEI05}${EI05}${NC}${CVI06}${VI06}${NC}${CEI06}${EI06}${NC}${CVI07}${VI07}${NC}${CEI07}${EI07}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEI09}${EI09}${NC}${CVI10}${VI10}${NC}${CEI10}${EI10}${NC}${CVI11}${VI11}${NC}${CEI11}${EI11}${NC} 7|______I           |"
echo -e " |         |   |    ${CEJ03}${EJ03}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEJ05}${EJ05}${NC}     ${CEJ07}${EJ07}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEJ09}${EJ09}${NC}    |   |                  |"
echo -e " |         |   |   | ${CEJ03}${EJ03}${NC}       ${CEJ05}${EJ05}${NC} ${CTB06}${TB06}${NC}XXXXX ${CEJ07}${EJ07}${NC}       ${CEJ09}${EJ09}${NC} |   |   |                  |"
echo -e " | J_______|___|___|_ ${CEJ03}${EJ03}${NC}${CVJ04}${VJ04}${NC}${CEJ04}${EJ04}${NC}${CVJ05}${VJ05}${NC}${CEJ05}${EJ05}${NC}  ${CTB06}${TB06}${NC}YYYYY  ${CEJ07}${EJ07}${NC}${CVJ08}${VJ08}${NC}${CEJ08}${EJ08}${NC}${CVJ09}${VJ09}${NC}${CEJ09}${EJ09}${NC} _|___|___|______J           |"
echo -e " |         |   |   |   |P8  ${CEK05}${EK05}${NC}  ${CTB06}${TB06}${NC}ZZZZZ  ${CEK07}${EK07}${NC}  P9|   |   |   |                  |"
echo -e " |         |   |   |   |   | ${CEK05}${EK05}${NC}       ${CEK07}${EK07}${NC} |   |   |   |   |                  |"
echo -e " | K_______|___|___|___|___|_ ${CEK05}${EK05}${NC}${CVK06}${VK06}${NC}${CEK06}${EK06}${NC}${CVK07}${VK07}${NC}${CEK07}${EK07}${NC} _|___|___|___|___|______K           |"
echo -e " |         |   |   |   |   |   |   |   |   |   |   |   |                  |"
echo -e " |         |01 |02 |03 |04 |05 |06 |07 |08 |09 |10 |11 |12                |"
echo -e " |                                                     Run Time: ${RUN_TIME} |"
echo -e " --------------------------------------------------------------------------"
}
# echo -e "⚀ ⚁ ⚂ ⚃ ⚄ ⚅"
# echo -e "🀙 🀚 🀛 🀜 🀝 🀞"

# Iterate through all roads left to right
# last=""
# for edge in $(cat contiguous-roads.txt | egrep '^E'); do
#   # echo "$edge"
#   this_edge=$(echo $edge | sed -e 's/:.*//g')
#   echo "$this_edge"
#   eval "C$this_edge='${RED}'"
#   eval "C$last='${NC}'"
#   clear
#   board
#   perl -e 'select(undef,undef,undef,.05)'
#   last="$this_edge"
# done

# Iterate through all perimeters
for ring in 1 2 3 4 5; do
  # echo "$ring"
  # echo "--------------"
  last=""
  for edge in $(cat "perimeter${ring}-roads.txt" | egrep '^E'); do
    this_edge=$(echo $edge | sed -e 's/:.*//g')
    echo "$this_edge"
    EDGES="$EDGES $this_edge"
    eval "C$this_edge='${GREEN}'"
    clear
    NOW=$(date +%s)
    DIFF=$((NOW-START_TIME))
    RUN_TIME=$(convertsecs $DIFF)
    board
    perl -e 'select(undef,undef,undef,.05)'
    last="$this_edge"
  done
done

# Iterate through all verticies
last=""
for vertex in $(cat verticies.txt | egrep '^V'); do
  # echo "$vertex"
  this_vertex=$(echo $vertex | sed -e 's/:.*//g')
  echo "$this_vertex"
  VERTS="$VERTS $this_vertex"
  eval "C$this_vertex='${RED}'"
  clear
  NOW=$(date +%s)
  DIFF=$((NOW-START_TIME))
  RUN_TIME=$(convertsecs $DIFF)
  board
  perl -e 'select(undef,undef,undef,.05)'
  last="$this_vertex"
done

prev="temp"
last="EB05"
next="EA06"
while true; do
  next=$(cat contiguous-roads.txt | grep "$next:" | sed -e 's/^.*://g' | tr , '\n' | grep -v "$last" | grep -v "$prev" | sort -R | head -1)
  echo "$next"
  eval "C$next='${BLUE}'"
  VERTEX=$(cat verticies.txt | grep "$next" | grep "$last" | sed -e 's/:.*//g')
  eval "C$VERTEX='${NC}'"
  eval "C$last='${BLUE}'"
  eval "C$prev='${NC}'"
  if [ -z "$last" ]; then
    echo "last: $last doesn't exist..."
    echo "next: $next"
    exit 1
  fi
  if [ -z "$next" ]; then
    echo "next: $next doesn't exist..."
    echo "last: $last"
    exit 1
  fi
  clear
  TOTAL=$((TOTAL+1))
  NOW=$(date +%s)
  DIFF=$((NOW-START_TIME))
  RUN_TIME=$(convertsecs $DIFF)
  board
  if ! [ -z "$VERTEX" ]; then
    # echo "VERTEX: $VERTEX"
    # echo "Before: $VERTS"
    VERTS=$(echo $VERTS | tr ' ' '\n' | grep -v "$VERTEX" | tr '\n' ' ')
    # echo "After: $VERTS"
    # sleep 2
  fi

  if ! [ -z "$next" ]; then
    # echo "next: $next"
    # echo "Before: $EDGES"
    EDGES=$(echo $EDGES | tr ' ' '\n' | grep -v "$next" | tr '\n' ' ')
    # echo "After: $EDGES"
    # sleep 2
  fi

  if [ -z "$EDGES" ] && [ -z "$VERTS" ]; then
    echo "Game over!"
    exit 0
  fi
  perl -e 'select(undef,undef,undef,.07)'
  prev="$last"
  last="$next"
done
