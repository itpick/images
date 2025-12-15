# amazon-cloudwatch-agent-operator-fips

A minimal, wolfi-based FIPS compliant image of Amazon CloudWatch Agent Operator developed to manage the CloudWatch Agent on kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent-operator-fips

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-operator-fips-to-docker && ./result/bin/load-amazon-cloudwatch-agent-operator-fips-to-docker
```
