# kyverno-notation-aws-fips

Kyverno extension service for Notation and the AWS signer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kyverno-notation-aws-fips

# Load into Docker
nix build .#load-kyverno-notation-aws-fips-to-docker && ./result/bin/load-kyverno-notation-aws-fips-to-docker
```
