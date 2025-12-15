# amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-fips

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-fips-to-docker && ./result/bin/load-amazon-cloudwatch-agent-start-amazon-cloudwatch-agent-fips-to-docker
```
