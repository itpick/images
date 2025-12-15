# amazon-cloudwatch-agent-config-translator-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent-config-translator-fips

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-config-translator-fips-to-docker && ./result/bin/load-amazon-cloudwatch-agent-config-translator-fips-to-docker
```
