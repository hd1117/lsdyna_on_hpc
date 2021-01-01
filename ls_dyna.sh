#!/usr/bin/sh
#PBS -l walltime=168:00:00 
#PBS -l select=1:ncpus=20:mem=24000mb:ompthreads=20
#PBS -q PRIVATE_QUEUE_NAME
#PBS -j oe
#PBS -N jobname
# ^^^^^^^ Make sure to change the jobname to something memorable

module load intel-suite/2017.6
module load ls-dyna/R9.1.0-double

export LSTC_LICENSE_SERVER=server_address        # Address of lsdyna server 
                                                 # (make sure you have access)

FILE=run.k                                       # name of k file input

FOLDER=$PBS_O_WORKDIR
cd $FOLDER 


ls-dyna i=$FILE   # execute ld dyna with input

ls -l             # print all file details to output file and
pwd               # print working directory