# Instruction for code tests

## Aim
- to test if the lstchain script `lstchain_create_irf_files.py` works correctly or not

## Structure
- two hierarchical shell scripts: parent `submitter.sh` and child `submittee.sh`:
	- the child script 
		- specifies the conda environment
		- defines the python command to execute the lstchain script
		- executes the commnad
	- the parent script 
	  	- creates a directory where the log files will be placed 
		- defines the arguments to pass to the lstchain script
		- overwrites the child script
		- executes the overwritten child script in the command line or submits it to the batch job system
 
## Test Procedure
1. specify your conda and environment in the child script `submittee.sh`
	- replace the conda.sh path with your own one (line.38)
	- specify the name of the environment in which you will run the lstchain analysis (line.40)
2. test the shell scripts (not the lstchain python script)
	- run the parent script `submitter.sh` without any changes, just by typing `sh submitter.sh`
	- the test is succesful if you find
		- the overwritten child script displayed
		- a joblog directory created in the current directory
3. test the python script
	- uncomment line.53 and 54 starting with `exec` and line.55 `sh submittee.sh` in the parent script
		- or uncommet line.58 if you prefer to submit it to the batch job system 
	- run the parent script
		- will take 10-30 sec; you may have to abort it if longer than 3 min
	- successful if you find
		- a help message in the log file: `cat ./joblog/<date>/stdout.out`
5. test it again with the full command
	- replace the python command in the child script: `COMMAND_TEST` &rarr; `COMMAND` in line.85 and line.86
	- run the parent script again
	- successful if you find
		- an irf file produced here: `./irf.fits.gz`
		- no error in the log file
