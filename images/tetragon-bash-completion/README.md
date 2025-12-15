# tetragon-bash-completion

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tetragon-bash-completion

# Load into Docker
nix build .#load-tetragon-bash-completion-to-docker && ./result/bin/load-tetragon-bash-completion-to-docker
```
