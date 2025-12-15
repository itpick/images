# json-mock

Container image for json-server to mock REST/JSON APIs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#json-mock

# Load into Docker
nix build .#load-json-mock-to-docker && ./result/bin/load-json-mock-to-docker
```
