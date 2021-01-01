# Run LS-DYNA on HPC
This repository contains the shell scripts used for running LS-DYNA on the HPC. Before using a shell file check the following: 

1. Set job name
2. Set server name 
3. Enter private queue (if required) 
4. Change walltime/ncpus/memory to match [job sizing guidance](https://www.imperial.ac.uk/admin-services/ict/self-service/research-support/rcs/computing/job-sizing-guidance/ "Job sizing guidance")

To execute LS DYNA on the HPC copy the modified shell file into the same folder as the k files. Run LS DYNA using the `qsub` command:

```
qsub ls_dyna.sh
```

Check the status of the job qstat `qstat`, cancel the job using `qdel jobnumber`, read output file after job is completed using `cat joboname.ojobnumber`.

## Using Massively Parallel Processing 

If you want to run the [mpp version of ls-dyna](https://ftp.lstc.com/anonymous/outgoing/support/FAQ/mpp.getting_started "LS-DYNA MPP Guidelines") you can use the `ls_dyna_mpp.sh` shell file. In addition to the above changes make sure you do the following:

5. Upload a mpp executable 
6. Enter the mpp directory at `export MPPDYNA=${MPPDYNA="<path/to/executable>"}`
7. Enter name of executable at `mpiexec ${MPPDYNA}/<name_of_executable> i=$FILE ncpu=20`

Run using the mpp shell file. 

```
qsub ls_dyna_mpp.sh
```

Check the status of the job qstat qstat, cancel the job using qdel jobnumber, read output file after job is completed using cat joboname.ojobnumber.