# kube-scheduler

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kube-scheduler

# Load into Docker
nix build .#load-kube-scheduler-to-docker && ./result/bin/load-kube-scheduler-to-docker
```
