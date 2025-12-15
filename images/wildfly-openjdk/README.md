# wildfly-openjdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#wildfly-openjdk

# Load into Docker
nix build .#load-wildfly-openjdk-to-docker && ./result/bin/load-wildfly-openjdk-to-docker
```
