# test-tmp-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#test-tmp-client

# Load into Docker
nix build .#load-test-tmp-client-to-docker && ./result/bin/load-test-tmp-client-to-docker
```
