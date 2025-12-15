# jenkins-inbound-agent Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | /home/jenkins |
| Entrypoint | /usr/local/bin/jenkins-agent |
| CMD | - |
| Volumes | /home/jenkins/agent/home/jenkins/.jenkins |
| Stop signal | - |
| Environment variables | AGENT_WORKDIR=/home/jenkins/agentJAVA_HOME=/usr/lib/jvm/default-jvmLANG=C.UTF-8PATH=/usr/lib/jvm/... |
