# telegraf

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 6s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#telegraf

# Load into Docker
nix build .#load-telegraf-to-docker && ./result/bin/load-telegraf-to-docker
```
