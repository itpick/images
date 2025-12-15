# deck

deck is a command-line interface for managing Kong Gateway configurations declaratively

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#deck

# Load into Docker
nix build .#load-deck-to-docker && ./result/bin/load-deck-to-docker
```
