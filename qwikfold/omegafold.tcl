package provide omegafold 1.0

set env(QWIKFOLDDIR) "/home/dgomes/github/QwikFold2/qwikfold/"

# Source Omegafold plugin namespace
source $env(QWIKFOLDDIR)/omegafold/namespace.tcl

proc OMEGAFOLD::omegafold {} {
    global env
    variable main_win

    # Main window.
    set           main_win [ toplevel .omegafold ]
    wm title     $main_win "OmegaFold Plugin 0.91"
    wm resizable $main_win 0 0     ; #Not resizable

    # Raise if closed/hidden
	if {[winfo exists $main_win] != 1} {
			raise $main_win

	} else {
			wm deiconify $main_win
	}

    # Source programs
	source $env(QWIKFOLDDIR)/omegafold/menubar.tcl   ; # Menu Bar - File
	# source $env(QWIKFOLDDIR)/omegafold/settings.tcl  ; # Menu Bar - Edit
	source $env(QWIKFOLDDIR)/omegafold/notebook.tcl  ; # Main notebook
	source $env(QWIKFOLDDIR)/omegafold/functions.tcl	; # Functions
    source $env(QWIKFOLDDIR)/omegafold/sanity_checks.tcl	; # Sanity checks

}

# Launch the main window
proc omegafold {} { return [eval OMEGAFOLD::omegafold]}

