# jenkins Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | tini -- /usr/local/bin/jenkins.sh |
| CMD | - |
| Volumes | /var/jenkins_home |
| Stop signal | - |
| Environment variables | COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.logJAVA_HOME=/usr/lib/jvm/java-17-o... |
