# mlflow-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /app |
| Entrypoint | /usr/share/mlflow/bin/python3 |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | IAMGUARDED_APP_NAME=mlflowPATH=/usr/share/mlflow/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us... |
