# shellcheck

ShellCheck -- Shell script analysis tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#shellcheck

# Load into Docker
nix build .#load-shellcheck-to-docker && ./result/bin/load-shellcheck-to-docker
```
