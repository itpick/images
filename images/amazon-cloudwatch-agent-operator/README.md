# amazon-cloudwatch-agent-operator

The Amazon CloudWatch Agent Operator is software developed to manage the CloudWatch Agent on kubernetes

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#amazon-cloudwatch-agent-operator

# Load into Docker
nix build .#load-amazon-cloudwatch-agent-operator-to-docker && ./result/bin/load-amazon-cloudwatch-agent-operator-to-docker
```
