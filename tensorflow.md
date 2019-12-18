### tensorflow

#### 1.14.0

Created as:

    conda create --name tensorflow-1.14.0 --clone python-data-3.7.3-1   
    conda activate tensorflow-1.14.0
    conda install tensorflow-gpu==1.14.0 keras
    
#### 1.13.1

Created as:

    conda create --name tensorflow-1.13.1 --clone python-data-3.7.3-1
    conda activate tensorflow-1.13.1
    conda install tensorflow-gpu==1.13.1 keras

#### 1.13.1-hvd

First install NCCL under `/appl/soft/ai/nccl`.

Created environment:

    conda create --name tensorflow-hvd-1.13.1 --clone tensorflow-1.13.1
    conda activate tensorflow-hvd-1.13.1
    conda install gcc_linux-64 gxx_linux-64
    ml gcc/8.3.0
    ml hpcx-mpi/2.4.0

Install horovod with `pip`:

    HOROVOD_NCCL_HOME=/appl/soft/ai/nccl/nccl_2.4.7-1+cuda10.0_x86_64 HOROVOD_GPU_ALLREDUCE=NCCL pip install --no-cache-dir horovod

If you need to redo it, just uninstall first: `pip uninstall horovod`.

In the slurm script on puhti you should no longer use `mpirun` but just `srun` directly, for example:

    export NCCL_DEBUG=INFO  # prints some useful NCCL debug info
    srun python3 my_horovod_script.py