local condaEnv = 'tensorflow-2.0.0'

help([[
Tensorflow deep learning library for Python

For more help see: https://docs.csc.fi/#apps/tensorflow/]])

if (mode() == "load") then
  LmodMessage("Warning: This module is under construction and may be modified at any time.")
end

family("python_ml_env")

local condaRoot = '/appl/soft/ai/miniconda3'
local envRoot = pathJoin(condaRoot, 'envs', condaEnv)
local libPath = pathJoin(envRoot, 'lib/python3.7')

prepend_path('PATH', pathJoin(envRoot, 'bin'))
prepend_path('PATH', '/appl/soft/ai/bin')

prepend_path('PYTHONPATH', pathJoin(libPath, 'site-packages'))
prepend_path('PYTHONPATH', pathJoin(libPath, 'lib-dynload'))
prepend_path('PYTHONPATH', pathJoin(libPath))

setenv('CONDA_DEFAULT_ENV', condaEnv)