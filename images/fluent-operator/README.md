# fluent-operator

Operator for Fluent Bit and Fluentd - previously known as FluentBit Operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#fluent-operator

# Load into Docker
nix build .#load-fluent-operator-to-docker && ./result/bin/load-fluent-operator-to-docker
```
