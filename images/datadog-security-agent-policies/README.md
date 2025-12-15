# datadog-security-agent-policies

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#datadog-security-agent-policies

# Load into Docker
nix build .#load-datadog-security-agent-policies-to-docker && ./result/bin/load-datadog-security-agent-policies-to-docker
```
