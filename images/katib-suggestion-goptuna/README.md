# katib-suggestion-goptuna

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#katib-suggestion-goptuna

# Load into Docker
nix build .#load-katib-suggestion-goptuna-to-docker && ./result/bin/load-katib-suggestion-goptuna-to-docker
```
