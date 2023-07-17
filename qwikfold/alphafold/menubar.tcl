# Do not tearoff menu bar items
option add *tearOff 0

menu $main_win.menubar
$main_win configure -menu $main_win.menubar

set m $main_win.menubar
menu $m.file
menu $m.edit
menu $m.help

$m add cascade -menu $m.file -label File
$m add cascade -menu $m.edit -label Settings
$m add cascade -menu $m.help -label Help

#$m.file add command -label "Load FASTA"   -command ::ALPHAFOLD::load_fasta
$m.file add command -label "Load Project" -command ::ALPHAFOLD::load_project
$m.edit add command -label "Setup Databases"     -command ::ALPHAFOLD::settings
#$m.edit add command -label "Save to .alphafoldrc" ;#    -command ::ALPHAFOLD::adv_settings
$m.help add command -label "Install"      -command "vmd_open_url http://www.ks.uiuc.edu/Research/vmd/plugins/alphafold/"
$m.help add command -label "QwikFold"     -command "vmd_open_url http://www.ks.uiuc.edu/Research/vmd/plugins/alphafold/"
$m.help add command -label "Alphafold"    -command "vmd_open_url https://github.com/deepmind/alphafold"
