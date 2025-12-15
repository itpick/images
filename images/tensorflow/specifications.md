# tensorflow Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /tf |
| Entrypoint | bash -c source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser ... |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | CUDA_HOME=/usr/local/cuda-12.3LANG=C.UTF-8LD_LIBRARY_PATH=/usr/share/tensorflow/lib64PATH=/usr/sh... |
