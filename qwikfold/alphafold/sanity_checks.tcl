# Sanity checks


proc check_environment {} {
  # AlphaFold must be properlly installed
  # AND user must load its conda environment before to launching VMD.
  catch {set e [exec python -c "import alphafold"]} result
  if { $result != "" } {
      tk_messageBox -message "Could not load AlphaFold module.\n\nLoad AlphaFold conda environment\nbefore to launching VMD" -icon error -type ok
      break
  }
  
}

proc validate_input_fields {} {
  variable main_win
  # Jobname must not be empty
  if { [info exists ALPHAFOLD::job_id]} {
    if { $ALPHAFOLD::job_id == "" } {
      tk_messageBox -parent .alphafold -message "Job name must not be empty" -icon error -type ok
      break
    }
  } else  {
      tk_messageBox -parent .alphafold -message "Job name is required" -icon error -type ok
    break
  }


# TODO: Make "mkdir" fancier, in case it doesn't work.
  if {[info exists ALPHAFOLD::output_path]} {
    if { ! [file isdirectory $ALPHAFOLD::output_path]} {
      set answer [tk_messageBox -parent .alphafold -message "Output folder does not exist.\nMay I create it?" -type yesno -icon question]
      switch -- $answer {
        yes {file mkdir $ALPHAFOLD::output_path }
        no break
      }
    }

  } else {
      tk_messageBox -parent .alphafold -message "Please set the output folder" -icon error -type ok
      break
  }

  # FASTA sequence must not be empty
  set ALPHAFOLD::fasta_sequence [ string trim [ $main_win.fasta.sequence get 1.0 end ] ]
  if { $ALPHAFOLD::fasta_sequence == "" } {
    tk_messageBox -parent .alphafold -message "Type or load a FASTA sequence" -icon error -type ok
    break
  }
  
  # Settings for databases
  if { [info exists ALPHAFOLD::alphafold_path ] } {
    if { $ALPHAFOLD::alphafold_path == "" } {
        tk_messageBox -parent .alphafold -message "Path to alphafold must be set." -icon error -type ok
        break
      }
    } else {
        tk_messageBox -parent .alphafold -message "Path to alphafold must be set." -icon error -type ok
        break
  }

  if { [info exists ALPHAFOLD::alphafold_data ] } {
    if { $ALPHAFOLD::alphafold_data == "" } {
      tk_messageBox -parent .alphafold -message "Path to alphafold databases must be set." -icon error -type ok
      break
    }
  } else {
      tk_messageBox -parent .alphafold -message "Path to alphafold databases must be set." -icon error -type ok
      break
  }

  # Either BFD or Small_bfd must be present.
  if {  $ALPHAFOLD::af_mode == "full" || $ALPHAFOLD::af_mode == "casp14" } {
    if { $ALPHAFOLD::data_bfd == "" } {
    tk_messageBox -parent .alphafold -message "Path to bfd database must be set.\nUse Edit->Settings to assign it." -icon error -type ok
    break
    }
  }

  if { $ALPHAFOLD::af_mode == "reduced" && $ALPHAFOLD::data_small_bfd == "" } {
    tk_messageBox -parent .alphafold -message "Path to small_bfd database must be set.\nUse Edit->Settings to assign it." -icon error -type ok
    break
  }

  # Other parameters are setup based on ALPHAFOLD::alphafold_data, enough checking for now.
}


proc print_summary {} {
puts "

# Config
-----------------------------------------------------------
 Job name: $ALPHAFOLD::job_id
   Output: $ALPHAFOLD::output_path

 Run Mode: $ALPHAFOLD::run_mode
Databases: $ALPHAFOLD::af_mode
-----------------------------------------------------------

# FASTA Sequence
-----------------------------------------------------------
$ALPHAFOLD::fasta_sequence

-----------------------------------------------------------

# Database PATHS
-----------------------------------------------------------
 Alphafold: $ALPHAFOLD::alphafold_path
    params: $ALPHAFOLD::data_params
       bfd: $ALPHAFOLD::data_bfd
 small_bfd: $ALPHAFOLD::data_small_bfd
    mgnify: $ALPHAFOLD::data_mgnify
     pdb70: $ALPHAFOLD::data_pdb70
  obsolete: $ALPHAFOLD::data_obsolete
uniclust30: $ALPHAFOLD::data_uniclust30
  uniref90: $ALPHAFOLD::data_uniref90
-----------------------------------------------------------
"
}



proc check_python_module { module } {
  # Checks if a python module is loadable

  #set module alphafold
  catch {set e [exec python -c "import $module"]} result

  if { $result != "" } {
    puts "[ Error ] $module not found
    conda install $module
    
    Review qwickfold install instructions at 
    http://www.ks.uiuc.edu/Research/vmd/plugins/alphafold/"

  } else {
      puts "$module found :)"
  }
}
