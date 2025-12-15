# dfc

CLI to convert Dockerfiles to use Chainguard Images and APKs in FROM and RUN lines

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dfc

# Load into Docker
nix build .#load-dfc-to-docker && ./result/bin/load-dfc-to-docker
```
