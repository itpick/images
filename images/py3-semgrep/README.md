# py3-semgrep

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#py3-semgrep

# Load into Docker
nix build .#load-py3-semgrep-to-docker && ./result/bin/load-py3-semgrep-to-docker
```
