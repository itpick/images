# localstack

A fully functional local AWS cloud stack. Develop and test your cloud & Serverless apps offline

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#localstack

# Load into Docker
nix build .#load-localstack-to-docker && ./result/bin/load-localstack-to-docker
```
