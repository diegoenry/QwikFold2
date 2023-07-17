# 
# Open a window for changing QwikFold settings
# 
proc ::ALPHAFOLD::settings {} {
  variable main_win
  
  # If already initialized, just turn on
  if { [winfo exists $main_win.settings] } {
    wm deiconify $settings_win
    return
  }

  set settings_win [toplevel "$main_win.settings"]
  wm title $settings_win "Advanced Settings" 
  wm resizable $settings_win 0 0 
  wm transient $settings_win $main_win
  raise $settings_win






########################################################################
# Base path to alphaFold2 databases 
########################################################################
grid [ ttk::labelframe $settings_win.dbs -text "Base Path for AlphaFold Genetic Databases" -relief groove ] -row 0 -columnspan 3 -padx 5 -pady 5 -sticky nsew

grid [ttk::entry $settings_win.dbs.data_entry -state readonly -width 50 -textvariable ALPHAFOLD::alphafold_data -validate focus -validatecommand {
		if {[%W get] == "AlphaFold databases"} {
			%W delete 0 end
		} elseif {[%W get] == ""} {
			set ALPHAFOLD::alphafold_data "Path to AlphaFold Genetic Databases"
		}
		return 1
		}] -column 0 -row 0 -padx 5 -pady 5 -sticky nsew

grid [ttk::button $settings_win.dbs.data_button -text "Browse" -command {
	set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "AlphaFold databases path" ]
	if {$dir != ""} {
		set ALPHAFOLD::alphafold_data $dir
		::ALPHAFOLD::set_dbs }
		}] -row 0 -column 1 -padx 5 -pady 5 -sticky ne

# Fill missing space 
grid columnconfigure $settings_win.dbs $settings_win.dbs.data_entry -weight 1

  ########################################################################
  # Non-standard paths to alphaFold2 databases 
  ########################################################################

  grid [ ttk::labelframe $settings_win.full_dbs -text "Custom Path to AlphaFold Genetic Databases" -relief groove ] -row 1 -padx 5 -pady 5 -sticky nsew

set dataset_row 0
# BFD
    grid [ttk::label $settings_win.full_dbs.bfd -text "bfd" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.bfd_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_bfd -validate focus -validatecommand {
            if {[%W get] == "bfd"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_bfd "bfd database"
            }
            return 1
            }] -column 1 -row 0 -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.bfd_button -text "Browse" -command {
        set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "bfd database path"]
        if {$dir != ""} {
            set ALPHAFOLD::data_bfd $dir}
            }] -row 0 -column 2 -padx 5 -pady 5 -sticky nsew



incr dataset_row 1
# SMALL_BFD
    grid [ttk::label $settings_win.full_dbs.small_bfd -text "small_bfd" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.small_bfd_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_small_bfd -validate focus -validatecommand {
            if {[%W get] == "small_bfd"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_small_bfd "small_bfd database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.small_bfd_button -text "Browse" -command {
        set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "small bfd database path"]
        if {$dir != ""} {
            set ALPHAFOLD::data_small_bfd $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# mgnify
    grid [ttk::label $settings_win.full_dbs.mgnify -text "mgnify" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.mgnify_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_mgnify -validate focus -validatecommand {
            if {[%W get] == "mgnify"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_mgnify "mgnify database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.mgnify_button -text "Browse" -command {
        set dir [tk_getOpenFile -parent .alphafold -initialdir ~ -title "mgnify database path" -filetypes [list { {.FASTA files} {.fasta .FASTA} } ] ] 
        if {$dir != ""} {
            set ALPHAFOLD::data_mgnify $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# pdb70
    grid [ttk::label $settings_win.full_dbs.pdb70 -text "pdb70" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.pdb70_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_pdb70 -validate focus -validatecommand {
            if {[%W get] == "pdb70"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_pdb70 "pdb70 database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.pdb70_button -text "Browse" -command {
        set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "pdb70 database path"]
        if {$dir != ""} {
            set ALPHAFOLD::data_pdb70 $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# pdb_mmcif
    grid [ttk::label $settings_win.full_dbs.pdb_mmcif -text "pdb_mmcif" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.pdb_mmcif_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_pdb_mmcif -validate focus -validatecommand {
            if {[%W get] == "pdb_mmcif"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_pdb_mmcif "pdb_mmcif database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.pdb_mmcif_button -text "Browse" -command {
        set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "pdb_mmcif database path"]
        if {$dir != ""} {
            set ALPHAFOLD::data_pdb_mmcif $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew

incr dataset_row 1
# obsolete
    grid [ttk::label $settings_win.full_dbs.obsolete -text "obsolete" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.obsolete_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_obsolete -validate focus -validatecommand {
            if {[%W get] == "obsolete"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_obsolete "obsolete database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.obsolete_button -text "Browse" -command {
        set dir [tk_getOpenFile -parent .alphafold -initialdir ~ -title "obsolete PDB list" -filetypes [list { {.dat files} {.dat .txt} } ] ] 

        if {$dir != ""} {
            set ALPHAFOLD::data_obsolete $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# uniclust30
    grid [ttk::label $settings_win.full_dbs.uniclust30 -text "uniclust30" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.uniclust30_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_uniclust30 -validate focus -validatecommand {
            if {[%W get] == "uniclust30"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_uniclust30 "uniclust30 database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.uniclust30_button -text "Browse" -command {
        set dir [tk_chooseDirectory -parent .alphafold -initialdir ~ -title "uniclust30 database path"]
        if {$dir != ""} {
            set ALPHAFOLD::data_uniclust30 $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# uniref90
    grid [ttk::label $settings_win.full_dbs.uniref90 -text "uniref90" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.uniref90_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_uniref90 -validate focus -validatecommand {
            if {[%W get] == "uniref90"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_uniref90 "uniref90 database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.uniref90_button -text "Browse" -command {
        set dir [tk_getOpenFile -parent .alphafold -initialdir ~ -title "uniref90.fasta file" -filetypes [list { {.fasta files} {.fasta} } ] ] 

        if {$dir != ""} {
            set ALPHAFOLD::data_uniref90 $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# uniprot
    grid [ttk::label $settings_win.full_dbs.uniprot -text "uniprot" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.uniprot_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_uniprot -validate focus -validatecommand {
            if {[%W get] == "uniprot"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_uniprot "uniprot database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.uniprot_button -text "Browse" -command {
        set dir [tk_getOpenFile -parent .alphafold -initialdir ~ -title "uniprot.fasta file" -filetypes [list { {.fasta files} {.fasta} } ] ] 
        if {$dir != ""} {
            set ALPHAFOLD::data_uniprot $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew


incr dataset_row 1
# pdb_seqres
grid [ttk::label $settings_win.full_dbs.pdb_seqres -text "pdb_seqres" ] -column 0 -row $dataset_row -padx 5 -pady 5 -sticky e

    grid [ttk::entry $settings_win.full_dbs.pdb_seqres_entry -state readonly -width 50 -textvariable ALPHAFOLD::data_pdb_seqres -validate focus -validatecommand {
            if {[%W get] == "pdb_seqres"} {
                %W delete 0 end
            } elseif {[%W get] == ""} {
                set ALPHAFOLD::data_pdb_seqres "pdb_seqres database"
            }
            return 1
            }] -column 1 -row $dataset_row -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.full_dbs.pdb_seqres_button -text "Browse" -command {
        set dir [tk_getOpenFile -parent .alphafold -initialdir ~ -title "pdb_seqres.txt file" -filetypes [list { {.txt files} {.txt} } ] ] 

        if {$dir != ""} {
            set ALPHAFOLD::data_pdb_seqres $dir}
            }] -row $dataset_row -column 2 -padx 5 -pady 5 -sticky nsew





# Close window
grid [ ttk::frame $settings_win.okclose ] -row 2 -columnspan 3 -padx 5 -pady 5 -sticky nsew

    grid [ttk::button $settings_win.okclose.close -text "Close" -command {
        wm iconify [toplevel "$main_win.settings"] 
                }] -row 0 -padx 5 -pady 5 -sticky nsew



}



proc ::ALPHAFOLD::set_dbs {} {
  set ALPHAFOLD::data_params     $ALPHAFOLD::alphafold_data/params
  set ALPHAFOLD::data_bfd        $ALPHAFOLD::alphafold_data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
  set ALPHAFOLD::data_small_bfd  $ALPHAFOLD::alphafold_data/small_bfd/bfd-first_non_consensus_sequences.fasta
  set ALPHAFOLD::data_mgnify     $ALPHAFOLD::alphafold_data/mgnify/mgy_clusters_2018_12.fa
  set ALPHAFOLD::data_pdb70      $ALPHAFOLD::alphafold_data/pdb70/pdb70
  set ALPHAFOLD::data_pdb_mmcif  $ALPHAFOLD::alphafold_data/pdb_mmcif/mmcif_files
  set ALPHAFOLD::data_obsolete   $ALPHAFOLD::alphafold_data/pdb_mmcif/obsolete.dat
  set ALPHAFOLD::data_uniclust30 $ALPHAFOLD::alphafold_data/uniclust30/uniclust30_2018_08/uniclust30_2018_08
  set ALPHAFOLD::data_uniref90   $ALPHAFOLD::alphafold_data/uniref90/uniref90.fasta
  set ALPHAFOLD::data_pdb_seqres $ALPHAFOLD::alphafold_data/pdb_seqres/pdb_seqres.txt
  set ALPHAFOLD::data_uniprot    $ALPHAFOLD::alphafold_data/uniprot/uniprot.fasta
  
# In the future we may migrate to a DICTIONARY
#   dict set ALPHAFOLD::data_paths data       $ALPHAFOLD::alphafold_data
#   dict set ALPHAFOLD::data_paths params     $ALPHAFOLD::alphafold_data/params
#   dict set ALPHAFOLD::data_paths bfd        $ALPHAFOLD::alphafold_data/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt
#   dict set ALPHAFOLD::data_paths small_bfd  $ALPHAFOLD::alphafold_data/small_bfd/bfd-first_non_consensus_sequences.fasta
#   dict set ALPHAFOLD::data_paths mgnify     $ALPHAFOLD::alphafold_data/mgnify/mgy_clusters.fa
#   dict set ALPHAFOLD::data_paths pdb70      $ALPHAFOLD::alphafold_data/pdb70/pdb70
#   dict set ALPHAFOLD::data_paths pdb_mmcif  $ALPHAFOLD::alphafold_data/pdb_mmcif/mmcif_files
#   dict set ALPHAFOLD::data_paths obsolete   $ALPHAFOLD::alphafold_data/pdb_mmcif/obsolete.dat
#   dict set ALPHAFOLD::data_paths uniclust30 $ALPHAFOLD::alphafold_data/uniclust30/uniclust30_2018_08/uniclust30_2018_08
#   dict set ALPHAFOLD::data_paths uniref90   $ALPHAFOLD::alphafold_data/uniref90/uniref90.fasta
}
