# alibi-detect

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 17s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#alibi-detect

# Load into Docker
nix build .#load-alibi-detect-to-docker && ./result/bin/load-alibi-detect-to-docker
```
