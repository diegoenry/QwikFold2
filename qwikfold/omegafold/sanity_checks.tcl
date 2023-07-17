# Sanity checks


proc check_environment {} {
  # AlphaFold must be properlly installed
  # AND user must load its conda environment before to launching VMD.
  catch {set e [exec python -c "import omegafold"]} result
  if { $result != "" } {
      tk_messageBox -message "Could not load OmegaFold module.\n\nLoad OmegaFold conda environment\nbefore to launching VMD" -icon error -type ok
      break
  }
  
}

proc validate_input_fields {} {
  variable main_win
  # Jobname must not be empty
  if { [info exists OMEGAFOLD::job_id]} {
    if { $OMEGAFOLD::job_id == "" } {
      tk_messageBox -parent .omegafold -message "Job name must not be empty" -icon error -type ok
      break
    }
  } else  {
      tk_messageBox -parent .omegafold -message "Job name is required" -icon error -type ok
    break
  }


# TODO: Make "mkdir" fancier, in case it doesn't work.
  if {[info exists OMEGAFOLD::output_path]} {
    if { ! [file isdirectory $OMEGAFOLD::output_path]} {
      set answer [tk_messageBox -parent .omegafold -message "Output folder does not exist.\nMay I create it?" -type yesno -icon question]
      switch -- $answer {
        yes {file mkdir $OMEGAFOLD::output_path }
        no break
      }
    }

  } else {
      tk_messageBox -parent .omegafold -message "Please set the output folder" -icon error -type ok
      break
  }

  # FASTA sequence must not be empty
  set OMEGAFOLD::fasta_sequence [ string trim [ $main_win.fasta.sequence get 1.0 end ] ]
  if { $OMEGAFOLD::fasta_sequence == "" } {
    tk_messageBox -parent .omegafold -message "Type or load a FASTA sequence" -icon error -type ok
    break
  }
  
  # Settings for databases
  # if { [info exists OMEGAFOLD::omegafold_path ] } {
  #   if { $OMEGAFOLD::omegafold_path == "" } {
  #       tk_messageBox -parent .omegafold -message "Path to omegafold must be set." -icon error -type ok
  #       break
  #     }
  #   } else {
  #       tk_messageBox -parent .omegafold -message "Path to omegafold must be set." -icon error -type ok
  #       break
  # }

  # if { [info exists OMEGAFOLD::omegafold_data ] } {
  #   if { $OMEGAFOLD::omegafold_data == "" } {
  #     tk_messageBox -parent .omegafold -message "Path to omegafold databases must be set." -icon error -type ok
  #     break
  #   }
  # } else {
  #     tk_messageBox -parent .omegafold -message "Path to omegafold databases must be set." -icon error -type ok
  #     break
  # }
  # Other parameters are setup based on OMEGAFOLD::omegafold_data, enough checking for now.
}


proc print_summary {} {
puts "

# Config
-----------------------------------------------------------
 Job name: $OMEGAFOLD::job_id
   Output: $OMEGAFOLD::output_path

-----------------------------------------------------------

# FASTA Sequence
-----------------------------------------------------------
$OMEGAFOLD::fasta_sequence

-----------------------------------------------------------

"
}



proc check_python_module { module } {
  # Checks if a python module is loadable

  #set module omegafold
  catch {set e [exec python -c "import $module"]} result

  if { $result != "" } {
    puts "[ Error ] $module not found
    conda install $module
    
    Review qwickfold install instructions at 
    http://www.ks.uiuc.edu/Research/vmd/plugins/omegafold/"

  } else {
      puts "$module found :)"
  }
}
