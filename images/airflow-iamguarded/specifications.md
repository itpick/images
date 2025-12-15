# airflow-iamguarded Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /opt/iamguarded/scripts/airflow/entrypoint.sh |
| CMD | /opt/iamguarded/scripts/airflow/run.sh |
| Volumes | - |
| Stop signal | - |
| Environment variables | AIRFLOW_HOME=/opt/iamguarded/airflowAIRFLOW_USER_HOME_DIR=/home/airflowLANG=C.UTF-8LANGUAGE=C.UTF... |
