namespace eval ::ALPHAFOLD:: {
    namespace export alphafold

#   Job ID will be used as output.
    variable job_id "alphafold"              ;   # Job id
    variable job_pid 
    variable af_mode  "reduced_dbs"         ;   # AlphaFold Database mode
    variable model_preset "monomer_ptm"     ;   # monomer, monomer_ptm, monomer_casp14, multimer.
    variable max_template_date "2021-11-01"

#   Where to hold the results
    variable results_folder         ;   # Yet to be propagated in more functions

#   Run options
    variable run_mode "local"       ;   # AlphaFold run mode
#   variable alphafold_server       ;   # DNS for our server #  Reserved future use.
    variable use_msa "no"
    variable use_gpu "False"        ; # User OpenMM CUDA code.

#   Original path   
    variable alphafold_path         ;#"Path to AlphaFold cloned from github"
    variable alphafold_data         ;#"Path to AlphaFold Genetic Databases"

#   FASTA variables
    variable fasta_sequence         ;   # Contents of FASTA sequence
    variable fasta_file             ;   # Path to FASTA sequence file to READ
    variable fasta_input            ;   # Path to FASTA sequence file to AlphaFold

#   AlphaFold variables
    variable data_params
    variable data_bfd
    variable data_small_bfd
    variable data_mgnify
    variable data_pdb70
    variable data_pdb_mmcif
    variable data_obsolete
    variable data_uniclust30
    variable data_uniref90
    variable data_pdb_seqres
    variable data_uniprot

# Dictionary
   variable data_paths
}
