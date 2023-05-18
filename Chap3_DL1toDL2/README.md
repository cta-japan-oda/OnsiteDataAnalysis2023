# Instruction
Make sure you have activated the environment for lstchain before running the script

1. Run the script `dl1_to_dl2.sh` without making any changes by typing `sh dl1_to_dl2.sh` in this directory
    - It will take 4~5 minutes until the script finishes. Produced DL2 file will be created in `output/` directory
1. Rerun the script `dl1_to_dl2.sh` with job batch system. You need to modify the following part of the script before running it
    - `DL1FILE` (line 11): `dl1_LST-1.Run09686.0000.h5` -> `dl1_LST-1.Run09686.0001.h5` (Just for avoiding the same file to be processed. Of course you can choose other files if you want)
    - `FLAG_JOB` (line 28): `false` -> `true`
    - `CONDAENV` (line 31): `lst-v0.9.10` -> Name of your lstchain environment
    - Log file will be written in `log/` directory
