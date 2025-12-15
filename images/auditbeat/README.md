# auditbeat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#auditbeat

# Load into Docker
nix build .#load-auditbeat-to-docker && ./result/bin/load-auditbeat-to-docker
```
