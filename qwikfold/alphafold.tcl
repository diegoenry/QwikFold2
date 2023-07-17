package provide alphafold 1.0

# Source Alphafold plugin namespace
source $env(QWIKFOLDDIR)/alphafold/namespace.tcl

proc ALPHAFOLD::alphafold {} {
    global env
    variable main_win

    # Main window.
    set           main_win [ toplevel .alphafold ]
    wm title     $main_win "AlphaFold2 Plugin 0.91"
    wm resizable $main_win 0 0     ; #Not resizable

    # Raise if closed/hidden
	if {[winfo exists $main_win] != 1} {
			raise $main_win

	} else {
			wm deiconify $main_win
	}

    # Source programs
	source $env(QWIKFOLDDIR)/alphafold/menubar.tcl   ; # Menu Bar - File
	source $env(QWIKFOLDDIR)/alphafold/settings.tcl  ; # Menu Bar - Edit
	source $env(QWIKFOLDDIR)/alphafold/notebook.tcl  ; # Main notebook
	source $env(QWIKFOLDDIR)/alphafold/functions.tcl	; # Functions
	source $env(QWIKFOLDDIR)/alphafold/sanity_checks.tcl	; # Sanity checks

}

# Launch the main window
proc alphafold {} { return [eval ALPHAFOLD::alphafold]}

