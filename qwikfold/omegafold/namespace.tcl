namespace eval ::OMEGAFOLD:: {
    namespace export omegafold

#   Job ID will be used as output.
    variable job_id "omegafold"              ;   # Job id
    variable af_mode  "reduced_dbs"         ;   # AlphaFold Database mode
    variable model_preset 10     ;   # monomer, monomer_ptm, monomer_casp14, multimer.
    # variable max_template_date "2021-11-01"

#   Where to hold the results
    variable results_folder         ;   # Yet to be propagated in more functions

#   Run options
#    variable run_mode "local"       ;   # AlphaFold run mode
#   variable omegafold_server       ;   # DNS for our server #  Reserved future use.

    variable num_cycle 10
    variable num_pseudo_msa 10

#   Original path   
    variable omegafold_path         ;#"Path to AlphaFold cloned from github"
    variable omegafold_data         ;#"Path to AlphaFold Genetic Databases"

#   FASTA variables
    variable fasta_sequence         ;   # Contents of FASTA sequence
    variable fasta_file             ;   # Path to FASTA sequence file to READ
    variable fasta_input            ;   # Path to FASTA sequence file to AlphaFold

#   AlphaFold variables
    variable data_params

# Dictionary
   variable data_paths
}
