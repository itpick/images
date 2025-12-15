# kube-logging-operator-fluentd-outputs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-logging-operator-fluentd-outputs

# Load into Docker
nix build .#load-kube-logging-operator-fluentd-outputs-to-docker && ./result/bin/load-kube-logging-operator-fluentd-outputs-to-docker
```
