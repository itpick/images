# cfssl-self-sign

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#cfssl-self-sign

# Load into Docker
nix build .#load-cfssl-self-sign-to-docker && ./result/bin/load-cfssl-self-sign-to-docker
```
