# tetragon

eBPF-based Security Observability and Runtime Enforcement

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 9s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#tetragon

# Load into Docker
nix build .#load-tetragon-to-docker && ./result/bin/load-tetragon-to-docker
```
