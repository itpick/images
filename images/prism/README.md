# prism

Prism is a set of packages for API mocking and contract testing with OpenAPI v2 (formerly known as Swagger) and OpenAPI v3.x

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#prism

# Load into Docker
nix build .#load-prism-to-docker && ./result/bin/load-prism-to-docker
```
