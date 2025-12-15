# amazon-cloudwatch-agent-fips

CloudWatch Agent enables you to collect and export host-level metrics and logs on instances running Linux or Windows server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent-fips

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-fips-to-docker && ./result/bin/load-amazon-cloudwatch-agent-fips-to-docker
```
