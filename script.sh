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
CURRENT_VERTS=$(echo $VERTS | tr ' ' '\n' | wc -l | awk '{print $1}')
CURRENT_EDGES=$(echo $EDGES | tr ' ' '\n' | wc -l | awk '{print $1}')


if [ -z "$VERTS" ]; then
  CURRENT_VERTS="00"
else
  CURRENT_VERTS=$(printf "%02d" $CURRENT_VERTS)
fi
if [ -z "$EDGES" ]; then
  CURRENT_EDGES="00"
else
  CURRENT_EDGES=$(printf "%02d" $CURRENT_EDGES)
fi
CURRENT_TOTAL=$(printf "%06d" $TOTAL)

# Flicker... this might help https://unix.stackexchange.com/questions/81167/prevent-text-screen-blinking-when-doing-clear
clear

echo -e " ${BORDER_TOP}"
echo -e " │                                                     Run Time: ${RUN_TIME} │"
echo -e " │                                                          Verticies: $CURRENT_VERTS │"
echo -e " │ ${GRID_L01_A}           Edges: $CURRENT_EDGES │"
echo -e " │ ${GRID_L02_A}       Total: $CURRENT_TOTAL │"
echo -e " │ ${GRID_L03_A}${P1A06}${P2A06}${GRID_L03_B}                     │"
# A
echo -e " │ ${GRID_L04_A}${CVA06}${VA06}${NC}${CEA06}${EA06}${NC}${CVA07}${VA07}${NC}${GRID_L04_B}                 │"
echo -e " │ ${GRID_L05_A}${CEB05}${EB05}${NC}${CTB06}${TAB06}${NC}${CEB07}${EB07}${NC}${GRID_L05_B}                     │"
echo -e " │ ${GRID_L06_A}${CEB05}${EB05}${NC}${CTB06}${TBB06}${NC}${CEB07}${EB07}${NC}${GRID_L06_B}                     │"
# B
echo -e " │ ${GRID_L07_A}${CVB04}${VB04}${NC}${CEB04}${EB04}${NC}${CVB05}${VB05}${NC}${CEB05}${EB05}${NC}${CTB06}${TCB06}${NC}${CEB07}${EB07}${NC}${CVB08}${VB08}${NC}${CEB08}${EB08}${NC}${CVB09}${VB09}${NC}${GRID_L07_B}                 │"
echo -e " │ ${GRID_L08_A}${P1C03}${CEC03}${EC03}${NC}${CTC04}${TAC04}${NC}${CEC05}${EC05}${NC}${CTB06}${TDB06}${NC}${CEC07}${EC07}${NC}${CTC08}${TAC08}${NC}${CEC09}${EC09}${NC}${P1C09}${GRID_L08_B}                     │"
echo -e " │ ${GRID_L09_A}${P2C03}${CEC03}${EC03}${NC}${CTC04}${TBC04}${NC}${CEC05}${EC05}${NC}${CTB06}${TEB06}${NC}${CEC07}${EC07}${NC}${CTC08}${TBC08}${NC}${CEC09}${EC09}${NC}${P2C09}${GRID_L09_B}                     │"
# C
echo -e " │ ${GRID_L10_A}${CVC02}${VC02}${NC}${CEC02}${EC02}${NC}${CVC03}${VC03}${NC}${CEC03}${EC03}${NC}${CTC04}${TCC04}${NC}${CEC05}${EC05}${NC}${CVC06}${VC06}${NC}${CEC06}${EC06}${NC}${CVC07}${VC07}${NC}${CEC07}${EC07}${NC}${CTC08}${TCC08}${NC}${CEC09}${EC09}${NC}${CVC10}${VC10}${NC}${CEC10}${EC10}${NC}${CVC11}${VC11}${NC}${GRID_L10_B}                 │"
echo -e " │ ${GRID_L11_A}${CED01}${ED01}${NC}${CTD02}${TAD02}${NC}${CED03}${ED03}${NC}${CTC04}${TDC04}${NC}${CED05}${ED05}${NC}${CTD06}${TAD06}${NC}${CED07}${ED07}${NC}${CTC08}${TDC08}${NC}${CED09}${ED09}${NC}${CTD10}${TAD10}${NC}${CED11}${ED11}${NC}${GRID_L11_B}                     │"
echo -e " │ ${GRID_L12_A}${CED01}${ED01}${NC}${CTD02}${TBD02}${NC}${CED03}${ED03}${NC}${CTC04}${TEC04}${NC}${CED05}${ED05}${NC}${CTD06}${TBD06}${NC}${CED07}${ED07}${NC}${CTC08}${TEC08}${NC}${CED09}${ED09}${NC}${CTD10}${TBD10}${NC}${CED11}${ED11}${NC}${GRID_L12_B}                     │"
# D
echo -e " │ ${GRID_L13_A}${CVD01}${VD01}${NC}${CED01}${ED01}${NC}${CTD02}${TCD02}${NC}${CED03}${ED03}${NC}${CVD04}${VD04}${NC}${CED04}${ED04}${NC}${CVD05}${VD05}${NC}${CED05}${ED05}${NC}${CTD06}${TCD06}${NC}${CED07}${ED07}${NC}${CVD08}${VD08}${NC}${CED08}${ED08}${NC}${CVD09}${VD09}${NC}${CED09}${ED09}${NC}${CTD10}${TCD10}${NC}${CED11}${ED11}${NC}${CVD12}${VD12}${NC}${GRID_L13_B}                 │"
echo -e " │ ${GRID_L14_A}${CEE01}${EE01}${NC}${CTD02}${TDD02}${NC}${CEE03}${EE03}${NC}${CTE04}${TAE04}${NC}${CEE05}${EE05}${NC}${CTD06}${TDD06}${NC}${CEE07}${EE07}${NC}${CTE08}${TAE08}${NC}${CEE09}${EE09}${NC}${CTD10}${TDD10}${NC}${CEE11}${EE11}${NC}${GRID_L14_B}                     │"
echo -e " │ ${GRID_L15_A}${CEE01}${EE01}${NC}${CTD02}${TED02}${NC}${CEE03}${EE03}${NC}${CTE04}${TBE04}${NC}${CEE05}${EE05}${NC}${CTD06}${TED06}${NC}${CEE07}${EE07}${NC}${CTE08}${TBE08}${NC}${CEE09}${EE09}${NC}${CTD10}${TED10}${NC}${CEE11}${EE11}${NC}${GRID_L15_B}                     │"
# E
echo -e " │ ${GRID_L16_A}${CEE01}${EE01}${NC}${CVE02}${VE02}${NC}${CEE02}${EE02}${NC}${CVE03}${VE03}${NC}${CEE03}${EE03}${NC}${CTE04}${TCE04}${NC}${CEE05}${EE05}${NC}${CVE06}${VE06}${NC}${CEE06}${EE06}${NC}${CVE07}${VE07}${NC}${CEE07}${EE07}${NC}${CTE08}${TCE08}${NC}${CEE09}${EE09}${NC}${CVE10}${VE10}${NC}${CEE10}${EE10}${NC}${CVE11}${VE11}${NC}${CEE11}${EE11}${NC}${GRID_L16_B}                 │"
echo -e " │ ${GRID_L17_A}${P1F01}${CEF01}${EF01}${NC}${CTF02}${TAF02}${NC}${CEF03}${EF03}${NC}${CTE04}${TDE04}${NC}${CEF05}${EF05}${NC}${CTF06}${TAF06}${NC}${CEF07}${EF07}${NC}${CTE08}${TDE08}${NC}${CEF09}${EF09}${NC}${CTF10}${TAF10}${NC}${CEF11}${EF11}${NC}${P1F11}${GRID_L17_B}                     │"
echo -e " │ ${GRID_L18_A}${P2F01}${CEF01}${EF01}${NC}${CTF02}${TBF02}${NC}${CEF03}${EF03}${NC}${CTE04}${TEE04}${NC}${CEF05}${EF05}${NC}${CTF06}${TBF06}${NC}${CEF07}${EF07}${NC}${CTE08}${TEE08}${NC}${CEF09}${EF09}${NC}${CTF10}${TBF10}${NC}${CEF11}${EF11}${NC}${P2F11}${GRID_L18_B}                     │"
# F
echo -e " │ ${GRID_L19_A}${CVF01}${VF01}${NC}${CEF01}${EF01}${NC}${CTF02}${TCF02}${NC}${CEF03}${EF03}${NC}${CVF04}${VF04}${NC}${CEF04}${EF04}${NC}${CVF05}${VF05}${NC}${CEF05}${EF05}${NC}${CTF06}${TCF06}${NC}${CEF07}${EF07}${NC}${CVF08}${VF08}${NC}${CEF08}${EF08}${NC}${CVF09}${VF09}${NC}${CEF09}${EF09}${NC}${CTF10}${TCF10}${NC}${CEF11}${EF11}${NC}${CVF12}${VF12}${NC}${GRID_L19_B}                 │"
echo -e " │ ${GRID_L20_A}${CEG01}${EG01}${NC}${CTF02}${TDF02}${NC}${CEG03}${EG03}${NC}${CTG04}${TAG04}${NC}${CEG05}${EG05}${NC}${CTF06}${TDF06}${NC}${CEG07}${EG07}${NC}${CTG08}${TAG08}${NC}${CEG09}${EG09}${NC}${CTF10}${TDF10}${NC}${CEG11}${EG11}${NC}${GRID_L20_B}                     │"
echo -e " │ ${GRID_L21_A}${CEG01}${EG01}${NC}${CTF02}${TEF02}${NC}${CEG03}${EG03}${NC}${CTG04}${TBG04}${NC}${CEG05}${EG05}${NC}${CTF06}${TEF06}${NC}${CEG07}${EG07}${NC}${CTG08}${TBG08}${NC}${CEG09}${EG09}${NC}${CTF10}${TEF10}${NC}${CEG11}${EG11}${NC}${GRID_L21_B}                     │"
# G
echo -e " │ ${GRID_L22_A}${CEG01}${EG01}${NC}${CVG02}${VG02}${NC}${CEG02}${EG02}${NC}${CVG03}${VG03}${NC}${CEG03}${EG03}${NC}${CTG04}${TCG04}${NC}${CEG05}${EG05}${NC}${CVG06}${VG06}${NC}${CEG06}${EG06}${NC}${CVG07}${VG07}${NC}${CEG07}${EG07}${NC}${CTG08}${TCG08}${NC}${CEG09}${EG09}${NC}${CVG10}${VG10}${NC}${CEG10}${EG10}${NC}${CVG11}${VG11}${NC}${CEG11}${EG11}${NC}${GRID_L22_B}                 │"
echo -e " │ ${GRID_L23_A}${CEH01}${EH01}${NC}${CTH02}${TAH02}${NC}${CEH03}${EH03}${NC}${CTG04}${TDG04}${NC}${CEH05}${EH05}${NC}${CTH06}${TAH06}${NC}${CEH07}${EH07}${NC}${CTG08}${TDG08}${NC}${CEH09}${EH09}${NC}${CTH10}${TAH10}${NC}${CEH11}${EH11}${NC}${GRID_L23_B}                     │"
echo -e " │ ${GRID_L24_A}${CEH01}${EH01}${NC}${CTH02}${TBH02}${NC}${CEH03}${EH03}${NC}${CTG04}${TEG04}${NC}${CEH05}${EH05}${NC}${CTH06}${TBH06}${NC}${CEH07}${EH07}${NC}${CTG08}${TEG08}${NC}${CEH09}${EH09}${NC}${CTH10}${TBH10}${NC}${CEH11}${EH11}${NC}${GRID_L24_B}                     │"
# H
echo -e " │ ${GRID_L25_A}${CVH01}${VH01}${NC}${CEH01}${EH01}${NC}${CTH02}${TCH02}${NC}${CEH03}${EH03}${NC}${CVH04}${VH04}${NC}${CEH04}${EH04}${NC}${CVH05}${VH05}${NC}${CEH05}${EH05}${NC}${CTH06}${TCH06}${NC}${CEH07}${EH07}${NC}${CVH08}${VH08}${NC}${CEH08}${EH08}${NC}${CVH09}${VH09}${NC}${CEH09}${EH09}${NC}${CTH10}${TCH10}${NC}${CEH11}${EH11}${NC}${CVH12}${VH12}${NC}${GRID_L25_B}                 │"
echo -e " │ ${GRID_L26_A}${CEI01}${EI01}${NC}${CTH02}${TDH02}${NC}${CEI03}${EI03}${NC}${CTI04}${TAI04}${NC}${CEI05}${EI05}${NC}${CTH06}${TDH06}${NC}${CEI07}${EI07}${NC}${CTI08}${TAI08}${NC}${CEI09}${EI09}${NC}${CTH10}${TDH10}${NC}${CEI11}${EI11}${NC}${GRID_L26_B}                     │"
echo -e " │ ${GRID_L27_A}${P1I01}${CEI01}${EI01}${NC}${CTH02}${TEH02}${NC}${CEI03}${EI03}${NC}${CTI04}${TBI04}${NC}${CEI05}${EI05}${NC}${CTH06}${TEH06}${NC}${CEI07}${EI07}${NC}${CTI08}${TBI08}${NC}${CEI09}${EI09}${NC}${CTH10}${TEH10}${NC}${CEI11}${EI11}${NC}${P1I11}${GRID_L27_B}                     │"
# I
echo -e " │ ${GRID_L28_A}${P2I01}${CEI01}${EI01}${NC}${CVI02}${VI02}${NC}${CEI02}${EI02}${NC}${CVI03}${VI03}${NC}${CEI03}${EI03}${NC}${CTI04}${TCI04}${NC}${CEI05}${EI05}${NC}${CVI06}${VI06}${NC}${CEI06}${EI06}${NC}${CVI07}${VI07}${NC}${CEI07}${EI07}${NC}${CTI08}${TCI08}${NC}${CEI09}${EI09}${NC}${CVI10}${VI10}${NC}${CEI10}${EI10}${NC}${CVI11}${VI11}${NC}${CEI11}${EI11}${NC}${P2I11}${GRID_L28_B}                 │"
echo -e " │ ${GRID_L29_A}${CEJ03}${EJ03}${NC}${CTI04}${TDI04}${NC}${CEJ05}${EJ05}${NC}${CTJ06}${TAJ06}${NC}${CEJ07}${EJ07}${NC}${CTI08}${TDI08}${NC}${CEJ09}${EJ09}${NC}${GRID_L29_B}                     │"
echo -e " │ ${GRID_L30_A}${CEJ03}${EJ03}${NC}${CTI04}${TEI04}${NC}${CEJ05}${EJ05}${NC}${CTJ06}${TBJ06}${NC}${CEJ07}${EJ07}${NC}${CTI08}${TEI08}${NC}${CEJ09}${EJ09}${NC}${GRID_L30_B}                     │"
# J
echo -e " │ ${GRID_L31_A}${CEJ03}${EJ03}${NC}${CVJ04}${VJ04}${NC}${CEJ04}${EJ04}${NC}${CVJ05}${VJ05}${NC}${CEJ05}${EJ05}${NC}${CTJ06}${TCJ06}${NC}${CEJ07}${EJ07}${NC}${CVJ08}${VJ08}${NC}${CEJ08}${EJ08}${NC}${CVJ09}${VJ09}${NC}${CEJ09}${EJ09}${NC}${GRID_L31_B}                 │"
echo -e " │ ${GRID_L32_A}${P1K04}${P2K04}${CEK05}${EK05}${NC}${CTJ06}${TDJ06}${NC}${CEK07}${EK07}${NC}${P1K08}${P2K08}${GRID_L32_B}                     │"
echo -e " │ ${GRID_L33_A}${CEK05}${EK05}${NC}${CTJ06}${TEJ06}${NC}${CEK07}${EK07}${NC}${GRID_L33_B}                     │"
# K
echo -e " │ ${GRID_L34_A}${CEK05}${EK05}${NC}${CVK06}${VK06}${NC}${CEK06}${EK06}${NC}${CVK07}${VK07}${NC}${CEK07}${EK07}${NC}${GRID_L34_B}                 │"
echo -e " │ ${GRID_L35_A}                     │"
echo -e " │ ${GRID_L36_A}                     │"
echo -e " │                                                                        │"
echo -e " ${BORDER_BOT}"
}
# echo -e "⚀ ⚁ ⚂ ⚃ ⚄ ⚅"
# echo -e "🀙 🀚 🀛 🀜 🀝 🀞"
# echo -e "① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫"
# echo -e "Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ"
# echo -e "ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ"
# echo -e "⓪ ⓫ ⓬ ⓭ ⓮ ⓯ ⓰ ⓱ ⓲ ⓳ ⓴ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ⓿"
# echo -e "█ ┌ ┐ └ ┘ ┼ ─ ╭  ╮ ╯ ╰ ◯ ◉ ◎ ● ▲ △"
# sleep 4
# Iterate through all roads left to right
# last=""
# for edge in $(cat board/contiguous-roads.txt | egrep '^E'); do
#   # echo "$edge"
#   this_edge=$(echo $edge | sed -e 's/:.*//g')
#   echo "$this_edge"
#   eval "C$this_edge='${RED}'"
#   eval "C$last='${NC}'"
#   board
#   perl -e 'select(undef,undef,undef,'$sleep_for')'
#   last="$this_edge"
# done

# Iterate through all perimeters
for ring in 5 4 3 2 1; do
  # echo "$ring"
  # echo "────────────--"
  last=""
  for edge in $(cat "board/perimeter${ring}-roads.txt" | egrep '^E'); do
    this_edge=$(echo $edge | sed -e 's/:.*//g')
    # echo "$this_edge"
    EDGES="$EDGES $this_edge"
    eval "C$this_edge='${RED}'"
    NOW=$(date +%s)
    DIFF=$((NOW-START_TIME))
    RUN_TIME=$(convertsecs $DIFF)
    board
    perl -e 'select(undef,undef,undef,'$sleep_for')'
    last="$this_edge"

  done
done

# Iterate through all verticies
for ring in 3 2 1; do
  last=""
  for vertex in $(cat "board/perimeter${ring}-settlements.txt" | egrep '^V' | sort -r); do
    # echo "$vertex"
    this_vertex=$(echo $vertex | sed -e 's/:.*//g')
    # echo "$this_vertex"
    VERTS="$VERTS $this_vertex"
    eval "C$this_vertex='${RED}'"
    NOW=$(date +%s)
    DIFF=$((NOW-START_TIME))
    RUN_TIME=$(convertsecs $DIFF)
    board
    perl -e 'select(undef,undef,undef,'$sleep_for')'
    last="$this_vertex"
  done
done

for lap in 1 2; do
  for ring in 1 2 3; do
    for tile in $(cat "board/tiles-${ring}.txt" | sed -e 's/^T//g'); do
      # VAL=$(eval "echo $(echo \"\$$tile\")")
      # echo "TILE: CTA${tile}: ${VAL}"
      RAND_FIRST=1 # not black
      # RAND_FIRST=$(echo 0 1 | tr ' ' '\n' | sort -R | head -1)
      RAND_SECOND=$(echo 0 1 2 3 4 5 6 7 | tr ' ' '\n' | sort -R | head -1)
      THIS_COLOR='\033['$RAND_FIRST';3'$RAND_SECOND'm'
      eval "CT${tile}='${THIS_COLOR}'"
      perl -e 'select(undef,undef,undef,'$sleep_for')'
      board
    done
  done
done

for ring in 1 2 3; do
  for tile in $(cat "board/tiles-${ring}.txt" | sed -e 's/^T//g' | sort -R); do
    eval "CT${tile}='${RED}'"
    perl -e 'select(undef,undef,undef,'$sleep_for')'
    board
  done
done

last_key="nothing"
last_val="nothing"

# for tile in $(cat vars.sh | egrep '^TA' | sed -e 's/=.*//g' | sed -e 's/TA//g'); do
for row in $(cat vars.sh| egrep '^TA' | sed -e 's/=.*//g' | sed -e 's/TA\([A-Z]\).*/\1/g' | sort | uniq); do
  for line in A B C D E; do
    for tile in $(cat vars.sh | egrep '^T'${line}${row} | sed -e 's/=.*//g' | sed -e 's/T'${line}${row}'//g'); do
      # eval "$last_key='${last_val}'"

      THIS_KEY="T${line}${row}${tile}"
      # i dunno... it works...
      THIS_VAL=$(eval "echo $(echo \"\$$THIS_KEY\")")
      # echo "$THIS_KEY: $THIS_VAL"
      last_key="$THIS_KEY"
      last_val="$THIS_VAL"
      #NEW_VAL=$(echo $THIS_VAL | tr -d '*' ' ')
      if [ $line = 'A' ]; then
        NEW_VAL="     ";
      fi
      if [ $line = 'B' ] || [ $line = 'E' ]; then
        NEW_VAL="       ";
      fi
      if [ $line = 'C' ]; then
        NEW_VAL="   $(echo $THIS_KEY | sed -e 's/TC//g')   ";
      fi
      if [ $line = 'D' ]; then
        NEW_VAL="         ";
      fi
      eval "$THIS_KEY='${NEW_VAL}'"
      VER_VAL=$(eval "echo $(echo \"\$$THIS_KEY\")")
    done
    NOW=$(date +%s)
    DIFF=$((NOW-START_TIME))
    RUN_TIME=$(convertsecs $DIFF)
    board
    perl -e 'select(undef,undef,undef,'$sleep_for')'
  done
done

sleep 1

before="tempp"
beforev="tempp"
prev="temp"
prevv="temp"
last="EB05"
next="EB05"
lastv="VA06"
while true; do
  # echo "---------- Before ------------"
  # echo "Before: $before:$beforev"
  # echo "Prev: $prev:$prevv"
  # echo "Last: $last:$lastv"
  # echo "Next: $next:$nextv"
  # echo "beforev: $(cat board/contiguous-roads.txt | grep $beforev:)"
  # echo "prev: $(cat board/contiguous-roads.txt | grep $prev:)"
  # echo "last: $(cat board/contiguous-roads.txt | grep $last:)"
  # echo "next: $(cat board/contiguous-roads.txt | grep $next:)"


  next=$(cat board/contiguous-roads.txt | grep "$next:" | sed -e 's/^.*://g' | tr , '\n' | grep -v "$last" | grep -v "$prev" | grep -v "$before" | sort -R)
  # the var next contains the connected edges to the last edge. this loop will pick an edge that hasn't already been selected
  for that in $next; do
    next_color=$(eval "echo $(echo \"\$C$that\")")
    if [[ "$next_color" != "$NC" ]]; then
      next=$that
      break
    fi
  done
  # If the var next has more than one value at this stage, all edges have been selected at least once, and a random edge is selected
  next=$(echo $next | sed -e 's/\ .*//g' | head -1)

  eval "C$next='${BLUE}'"
  nextv=$(cat board/verticies.txt | grep "$next" | grep "$last" | sed -e 's/:.*//g')

  # echo "---------- After ------------"
  # echo "Before: $before:$beforev"
  # echo "Prev: $prev:$prevv"
  # echo "Last: $last:$lastv"
  # echo "Next: $next:$nextv"
  # echo "-----------------------------"
  if [ -z "$nextv" ]; then
    echo "$next:$last has no vertex..."
    echo "prev: $(cat board/contiguous-roads.txt | grep $prev:)"
    echo "last: $(cat board/contiguous-roads.txt | grep $last:)"
    echo "next: $(cat board/contiguous-roads.txt | grep $next:)"
    echo "-----------------------------"

    echo "cat board/contiguous-roads.txt | grep \"$next:\" | sed -e 's/^.*://g' | tr , '\n' | grep -v \"$last\" | grep -v \"$prev\""
    exit 0
  fi
  eval "C$nextv='${BLUE}'"
  eval "C$last='${BLUE}'"
  eval "C$prev='${BLUE}'"
  eval "C$before='${NC}'"
  if ! [[ "$nextv" = "$lastv" ]]; then
    eval "C$lastv='${BLUE}'"
  fi
  if ! [[ "$prevv" = "$lastv" ]]; then
    eval "C$prevv='${BLUE}'"
  fi
  if ! [[ "$prevv" = "$beforev" ]]; then
    eval "C$beforev='${NC}'"
  fi
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
  TOTAL=$((TOTAL+1))
  NOW=$(date +%s)
  DIFF=$((NOW-START_TIME))
  RUN_TIME=$(convertsecs $DIFF)
  board

  # Redefine blue for some reason
  # RAND_FIRST=$(echo 0 1 | tr ' ' '\n' | sort -R | head -1)
  # RAND_SECOND=$(echo 0 1 2 3 4 5 6 7 | tr ' ' '\n' | sort -R | head -1)
  # BLUE='\033['$RAND_FIRST';3'$RAND_SECOND'm'

  if ! [ -z "$nextv" ]; then
    this_color=$(eval "echo $(echo \"\$C$nextv\")")
    # echo "nextv: $nextv -> $this_color"
  

    # echo "Before: '$VERTS'"
    VERTS=$(echo $VERTS | tr ' ' '\n' | grep -v "$nextv" | tr '\n' ' ')
    # echo "After: '$VERTS'"
    # sleep 2
  fi

  if ! [ -z "$next" ]; then
    # echo "next: $next"
    # echo "Before: '$EDGES'"
    EDGES=$(echo $EDGES | tr ' ' '\n' | grep -v "$next" | tr '\n' ' ')
    # echo "After: '$EDGES'"
    # sleep 2
  fi

  if [ "$EDGES" == " " ]; then
    # echo "EDGES SPACE"
    EDGES=""
  fi
  if [ "$VERTS" == " " ]; then
    # echo "VERTS SPACE"
    VERTS=""
  fi
  if [ -z "$EDGES" ] && [ -z "$VERTS" ]; then
    board
    echo "Game over!"
    exit 0
  fi


    # read -t 1 -n 1 input
    # if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
    #     # The following line is for the prompt to appear on a new line.
    #     echo
    #     break 
    # fi
    # if [[ $input = "p" ]] || [[ $input = "P" ]]; then
    #     # The following line is for the prompt to appear on a new line.
    #     sleep 10
    #     unset input
    # fi

  perl -e 'select(undef,undef,undef,'$sleep_forr')'
  before="$prev"
  beforev="$prevv"
  prev="$last"
  prevv="$lastv"
  last="$next"
  lastv="$nextv"
done