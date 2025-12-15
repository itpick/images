# jenkins-inbound-agent

The Jenkins Inbound Agent container image is designed to run as a Jenkins agent that connects to a Jenkins controller via inbound (JNLP) connection method, used in Jenkins Kubernetes setups

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jenkins-inbound-agent

# Load into Docker
nix build .#load-jenkins-inbound-agent-to-docker && ./result/bin/load-jenkins-inbound-agent-to-docker
```
