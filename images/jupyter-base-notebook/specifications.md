# jupyter-base-notebook Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /home/jovyan |
| Entrypoint | /sbin/tini -g -- start.sh |
| CMD | start-notebook.py |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/home/jovyanJUPYTER_PORT=8888LANG=C.UTF-8LANGUAGE=C.UTF-8LC_ALL=C.UTF-8NB_GID=100NB_UID=1000... |
