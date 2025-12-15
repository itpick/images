# gh

The GitHub CLI, or gh, is a command-line interface to GitHub for use in your terminal or your scripts

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#gh

# Load into Docker
nix build .#load-gh-to-docker && ./result/bin/load-gh-to-docker
```
