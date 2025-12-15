# datadog-cluster-agent-fips

Chainguard Containers are regularly-updated, secure-by-default container images

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-cluster-agent-fips

# Load into Docker
nix build .#load-datadog-cluster-agent-fips-to-docker && ./result/bin/load-datadog-cluster-agent-fips-to-docker
```
