# airflow-core Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 50000 |
| Working directory | /opt/airflow |
| Entrypoint | /usr/bin/dumb-init -- /entrypoint |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | AIRFLOW_HOME=/opt/airflowAIRFLOW_USER_HOME_DIR=/home/airflowAIRFLOW__CORE__LOAD_EXAMPLES=falseDUM... |
