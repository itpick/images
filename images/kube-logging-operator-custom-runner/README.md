# kube-logging-operator-custom-runner

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-logging-operator-custom-runner

# Load into Docker
nix build .#load-kube-logging-operator-custom-runner-to-docker && ./result/bin/load-kube-logging-operator-custom-runner-to-docker
```
