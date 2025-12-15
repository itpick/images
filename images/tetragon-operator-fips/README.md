# tetragon-operator-fips

FIPS-Complaint Images for Tetragon. eBPF-based Security Observability and Runtime Enforcement

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tetragon-operator-fips

# Load into Docker
nix build .#load-tetragon-operator-fips-to-docker && ./result/bin/load-tetragon-operator-fips-to-docker
```
