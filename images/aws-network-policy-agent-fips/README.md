# aws-network-policy-agent-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-network-policy-agent-fips

# Load into Docker
nix build .#load-aws-network-policy-agent-fips-to-docker && ./result/bin/load-aws-network-policy-agent-fips-to-docker
```
