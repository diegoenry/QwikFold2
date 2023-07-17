###########################
# Alphafold setup for VMD #
###########################

# 1 Check if AlphaFold is available

  # User must load its conda environment before to launching VMD.
  catch {set e [exec python -c "import alphafold"]} result
    if { $result != "" } {
        tk_messageBox \
        -message "Could not load QwikFold.\n\nPlease load an AlphaFold conda environment before launching VMD" \
        -icon error -type ok
        return
    }

