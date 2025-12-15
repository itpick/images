# wildfly

WildFly is a lightweight and open-source application server designed for deploying and running Java applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wildfly

# Load into Docker
nix build .#load-wildfly-to-docker && ./result/bin/load-wildfly-to-docker
```
