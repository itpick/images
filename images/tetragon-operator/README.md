# tetragon-operator

eBPF-based Security Observability and Runtime Enforcement

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tetragon-operator

# Load into Docker
nix build .#load-tetragon-operator-to-docker && ./result/bin/load-tetragon-operator-to-docker
```
