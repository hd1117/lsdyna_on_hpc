#!/usr/bin/sh
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=20:mem=24000mb:mpiprocs=20
#PBS -j oe
#PBS -N jobname
      # ^^^^^^^ Make sure to change the jobname to something memorable

module load intel-suite
module load mpi

export LSTC_LICENSE_SERVER=server_address        # Address of lsdyna server 
                                                 # (make sure you have access)
export MPPDYNA=${MPPDYNA="<path/to/executable>"} # Location of mpp dyna exe

FILE=run.k                                       # name of k file input

FOLDER=$PBS_O_WORKDIR   
cd $FOLDER 

# Name of executable comes after directory which it is stored in. The
# executable should be the following: redhat, sse2, intelmpi. Others may
# not work due to architectural requirements. 
mpiexec ${MPPDYNA}/<name_of_executable> i=$FILE ncpu=20

ls -l # print all file details to output file and
pwd   # print working directory