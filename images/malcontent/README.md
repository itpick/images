# malcontent

Enumerate binary capabilities, including malicious behaviors

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#malcontent

# Load into Docker
nix build .#load-malcontent-to-docker && ./result/bin/load-malcontent-to-docker
```
