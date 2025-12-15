# pg-failover-slots

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pg-failover-slots

# Load into Docker
nix build .#load-pg-failover-slots-to-docker && ./result/bin/load-pg-failover-slots-to-docker
```
