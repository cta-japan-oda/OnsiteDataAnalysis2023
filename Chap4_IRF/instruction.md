# Instruction for code tests

## test.1
- aim
  - to test if the lstchain script `lstchain_create_irf_files.py` properly works or not
- procedure
  - run the ready-made script without any changes: `sh submitter.sh`
  - will only take 10-30 seconds; you may have to abort it if longer than 3 min.
- check
  - two files `stdout.log` and `stderr.log` will be made.
  - succesful if you find a "help message" in `stdout.log`. Check it by `cat stdout.log`.
## test.2
- aim
  - to test if the script properly works in your environment
- procedure
  - run it after the following changes:
    - L80: `COMMAND_TEST` &rarr; `COMMAND`
    - L81: `COMMAND_TEST` &rarr; `COMMAND`
- check
  - ditto 
