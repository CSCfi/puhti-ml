local condaEnv = 'pytorch-hvd-1.3.1'

help([[
PyTorch machine learning library for Python

For more help see: https://docs.csc.fi/#apps/pytorch/]])

family("python_ml_env")

depends_on("gcc/8.3.0")
depends_on("hpcx-mpi/2.4.0")

local condaRoot = '/appl/soft/ai/miniconda3'
local envRoot = pathJoin(condaRoot, 'envs', condaEnv)
local libPath = pathJoin(envRoot, 'lib/python3.7')

prepend_path('PATH', pathJoin(envRoot, 'bin'))
prepend_path('PATH', '/appl/soft/ai/bin')

prepend_path('PYTHONPATH', pathJoin(libPath, 'site-packages'))
prepend_path('PYTHONPATH', pathJoin(libPath, 'lib-dynload'))
prepend_path('PYTHONPATH', pathJoin(libPath))

prepend_path('LD_LIBRARY_PATH', '/appl/soft/ai/nccl/nccl_2.4.8-1+cuda10.1_x86_64/lib/')

setenv('CONDA_DEFAULT_ENV', condaEnv)