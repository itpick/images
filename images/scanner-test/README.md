# scanner-test

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#scanner-test

# Load into Docker
nix build .#load-scanner-test-to-docker && ./result/bin/load-scanner-test-to-docker
```
