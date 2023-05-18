# Instruction
Make sure you have activated the lstchain environment before following the instructions below

1. Run the script `tune_nsb.sh` without making any changes by typing `sh tune_nsb.sh` in this directory 
    - A config file with updated NSB-tuning parameters (`output_dl1ab_standard_config.json`) will be newly created
3. Run the script `dl1ab.sh` without making any changes by `sh dl1ab.sh`
    - It will take 4~5 minutes until the script finishes. The produced DL1 file will be stored in `output/` directory
4. Rerun the script `dl1ab.sh` with job batch system. You need to modify the following part of the script before running it
    - `DL1FILE` (line 10): `/fefs/aswg/data/real/DL1/20*/v*/tailcut84/dl1_LST-1.Run09686.0000.h5` -> `/fefs/aswg/data/mc/DL1/AllSky/20230127_v0.9.12_base_prod_az_tel/TestingDataset/*/dl1_simtel_corsika_theta_23.630_az_100.758_run1.h5` 
    - `CONFIG` (line 19): `dl1ab_standard_config.json` -> `output_dl1ab_standard_config.json` (Not so necessary)
    - `FLAG_JOB` (line 22): `false` -> `true`
    - `CONDAENV` (line 25): `lst-v0.9.10` -> Name of your lstchain environment
    - Log file will be written in `log/` directory
