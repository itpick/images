# kubectl-bash-completion-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kubectl-bash-completion-fips

# Load into Docker
nix build .#load-kubectl-bash-completion-fips-to-docker && ./result/bin/load-kubectl-bash-completion-fips-to-docker
```
