#!╱bin╱bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
EDGES=""
VERTS=""
TOTAL=0
NC='\033[0m' # No Color
convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}
RUN_TIME=""
sleep_for="0.03"
sleep_forr="0.03"
# sleep_forr="0.1"
BORDER_TOP="╭────────────────────────────────────────────────────────────────────────╮"
BORDER_BOT="╰────────────────────────────────────────────────────────────────────────╯"
GRID_L01_A="     ①   ②   ③   ④   ⑤   ⑥   ⑦   ⑧   ⑨   ⑩   ⑪   ⑫"
GRID_L02_A="     │   │   │   │   │   │   │   │   │   │   │   │"
GRID_L03_A="     │   │   │   │   │   │"
GRID_L03_B="│   │   │   │   │   │"
GRID_L04_A="Ⓐ────┼───┼───┼───┼───┼── "
GRID_L04_B=" ──┼───┼───┼───┼───┼───Ⓐ"
GRID_L05_A="     │   │   │   │   │  "
GRID_L05_B="  │   │   │   │   │"
GRID_L06_A="     │   │   │   │   │ "
GRID_L06_B=" │   │   │   │   │"
GRID_L07_A="Ⓑ────┼───┼───┼── "
GRID_L07_B=" ──┼───┼───┼───Ⓑ"
GRID_L08_A="     │   │   │"
GRID_L08_B="│   │   │"
GRID_L09_A="     │   │   │"
GRID_L09_B="│   │   │"
GRID_L10_A="Ⓒ────┼─  "
GRID_L10_B=" ──┼───Ⓒ"
GRID_L11_A="     │  "
GRID_L11_B="  │"
GRID_L12_A="     │ "
GRID_L12_B=" │"
GRID_L13_A="Ⓓ─── "
GRID_L13_B="───Ⓓ"
GRID_L14_A="     │"
GRID_L14_B="│"
GRID_L15_A="     │ "
GRID_L15_B=" │"
GRID_L16_A="Ⓔ────┼─ "
GRID_L16_B=" ─┼───Ⓔ"
GRID_L17_A="     │"
GRID_L17_B="│"
GRID_L18_A="     │"
GRID_L18_B="│"
GRID_L19_A="Ⓕ─── "
GRID_L19_B="───Ⓕ"
GRID_L20_A="     │"
GRID_L20_B="│"
GRID_L21_A="     │ "
GRID_L21_B=" │"
GRID_L22_A="Ⓖ────┼─ "
GRID_L22_B=" ─┼───Ⓖ"
GRID_L23_A="     │  "
GRID_L23_B="  │"
GRID_L24_A="     │ "
GRID_L24_B=" │"
GRID_L25_A="Ⓗ─── "
GRID_L25_B="───Ⓗ"
GRID_L26_A="     │"
GRID_L26_B="│"
GRID_L27_A="     │"
GRID_L27_B="│"
GRID_L28_A="Ⓘ────┼"
GRID_L28_B="┼───Ⓘ"
GRID_L29_A="     │   │    "
GRID_L29_B="    │   │"
GRID_L30_A="     │   │   │ "
GRID_L30_B=" │   │   │"
GRID_L31_A="Ⓙ────┼───┼───┼─ "
GRID_L31_B=" ─┼───┼───┼───Ⓙ"
GRID_L32_A="     │   │   │   │"
GRID_L32_B="│   │   │   │"
GRID_L33_A="     │   │   │   │   │ "
GRID_L33_B=" │   │   │   │   │"
GRID_L34_A="Ⓚ────┼───┼───┼───┼───┼─ "
GRID_L34_B=" ─┼───┼───┼───┼───┼───Ⓚ"
GRID_L35_A="     │   │   │   │   │   │   │   │   │   │   │   │"
GRID_L36_A="     ①   ②   ③   ④   ⑤   ⑥   ⑦   ⑧   ⑨   ⑩   ⑪   ⑫"

P1A06="P"
P2A06="1 "
P1C03="P "
P2C03="2"
P1C09=" P"
P2C09="3"
P1F01="P "
P2F01="4"
P1F11=" P"
P2F11="5"
P1I01="P"
P2I01="6 "
P1I11="P"
P2I11=" 7"
P1K04="P"
P2K04="8  "
P1K08=" P"
P2K08="9 "

VA06="●"
VA07="●"
VB04="●"
VB05="●"
VB08="●"
VB09="●"
VC02="●"
VC03="●"
VC06="●"
VC07="●"
VC10="●"
VC11="●"
VD01="●"
VD04="●"
VD05="●"
VD08="●"
VD09="●"
VD12="●"
VE02="●"
VE03="●"
VE06="●"
VE07="●"
VE10="●"
VE11="●"
VF01="●"
VF04="●"
VF05="●"
VF08="●"
VF09="●"
VF12="●"
VG02="●"
VG03="●"
VG06="●"
VG07="●"
VG10="●"
VG11="●"
VH01="●"
VH04="●"
VH05="●"
VH08="●"
VH09="●"
VH12="●"
VI02="●"
VI03="●"
VI06="●"
VI07="●"
VI10="●"
VI11="●"
VJ04="●"
VJ05="●"
VJ08="●"
VJ09="●"
VK06="●"
VK07="●"

EA06="───"
EB04="───"
EB05="╱"
EB07="╲"
EB08="───"
EC02="───"
EC03="╱"
EC05="╲"
EC06="───"
EC07="╱"
EC09="╲"
EC10="───"

ED01="╱"
ED03="╲"
ED04="───"
ED05="╱"
ED07="╲"
ED08="───"
ED09="╱"
ED11="╲"

EE01="╲"
EE02="───"
EE03="╱"
EE05="╲"
EE06="───"
EE07="╱"
EE09="╲"
EE10="───"
EE11="╱"

EF01="╱"
EF03="╲"
EF04="───"
EF05="╱"
EF07="╲"
EF08="───"
EF09="╱"
EF11="╲"

EG01="╲"
EG02="───"
EG03="╱"
EG05="╲"
EG06="───"
EG07="╱"
EG09="╲"
EG10="───"
EG11="╱"

EH01="╱"
EH03="╲"
EH04="───"
EH05="╱"
EH07="╲"
EH08="───"
EH09="╱"
EH11="╲"

EI01="╲"
EI02="───"
EI03="╱"
EI05="╲"
EI06="───"
EI07="╱"
EI09="╲"
EI10="───"
EI11="╱"

EJ03="╲"
EJ04="───"
EJ05="╱"
EJ07="╲"
EJ08="───"
EJ09="╱"
EK05="╲"
EK06="───"
EK07="╱"



TAB06="▟███▙"
TBB06="▟█████▙"
TCB06="▟███████▙"
TDB06="▜███████▛"
TEB06="▜█████▛"
TAC04="▟███▙"
TBC04="▟█████▙"
TCC04="▟███████▙"
TDC04="▜███████▛"
TEC04="▜█████▛"
TAC08="▟███▙"
TBC08="▟█████▙"
TCC08="▟███████▙"
TDC08="▜███████▛"
TEC08="▜█████▛"
TAD02="▟███▙"
TBD02="▟█████▙"
TCD02="▟███████▙"
TDD02="▜███████▛"
TED02="▜█████▛"
TAD06="▟███▙"
TBD06="▟█████▙"
TCD06="▟███████▙"
TDD06="▜███████▛"
TED06="▜█████▛"
TAD10="▟███▙"
TBD10="▟█████▙"
TCD10="▟███████▙"
TDD10="▜███████▛"
TED10="▜█████▛"
TAE04="▟███▙"
TBE04="▟█████▙"
TCE04="▟███████▙"
TDE04="▜███████▛"
TEE04="▜█████▛"
TAE08="▟███▙"
TBE08="▟█████▙"
TCE08="▟███████▙"
TDE08="▜███████▛"
TEE08="▜█████▛"
TAF02="▟███▙"
TBF02="▟█████▙"
TCF02="▟███████▙"
TDF02="▜███████▛"
TEF02="▜█████▛"
TAF06="▟███▙"
TBF06="▟█████▙"
TCF06="▟███████▙"
TDF06="▜███████▛"
TEF06="▜█████▛"
TAF10="▟███▙"
TBF10="▟█████▙"
TCF10="▟███████▙"
TDF10="▜███████▛"
TEF10="▜█████▛"
TAG04="▟███▙"
TBG04="▟█████▙"
TCG04="▟███████▙"
TDG04="▜███████▛"
TEG04="▜█████▛"
TAG08="▟███▙"
TBG08="▟█████▙"
TCG08="▟███████▙"
TDG08="▜███████▛"
TEG08="▜█████▛"
TAH02="▟███▙"
TBH02="▟█████▙"
TCH02="▟███████▙"
TDH02="▜███████▛"
TEH02="▜█████▛"
TAH06="▟███▙"
TBH06="▟█████▙"
TCH06="▟███████▙"
TDH06="▜███████▛"
TEH06="▜█████▛"
TAH10="▟███▙"
TBH10="▟█████▙"
TCH10="▟███████▙"
TDH10="▜███████▛"
TEH10="▜█████▛"
TAI04="▟███▙"
TBI04="▟█████▙"
TCI04="▟███████▙"
TDI04="▜███████▛"
TEI04="▜█████▛"
TAI08="▟███▙"
TBI08="▟█████▙"
TCI08="▟███████▙"
TDI08="▜███████▛"
TEI08="▜█████▛"
TAJ06="▟███▙"
TBJ06="▟█████▙"
TCJ06="▟███████▙"
TDJ06="▜███████▛"
TEJ06="▜█████▛"