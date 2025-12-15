# kubectl-bash-completion

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-bash-completion

# Load into Docker
nix build .#load-kubectl-bash-completion-to-docker && ./result/bin/load-kubectl-bash-completion-to-docker
```
