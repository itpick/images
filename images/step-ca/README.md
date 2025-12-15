# step-ca

Minimal image of step-ca, an online Certificate Authority (CA) for secure, automated X.509 and SSH certificate management

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#step-ca

# Load into Docker
nix build .#load-step-ca-to-docker && ./result/bin/load-step-ca-to-docker
```
