# dask-kubernetes Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | /src/dask_kubernetes |
| Entrypoint | kopf run -m dask_kubernetes.operator.controller |
| CMD | --liveness=http://0.0.0.0:8080/healthz --verbose --all-namespaces |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/share/dask-kubernetes/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binP... |
