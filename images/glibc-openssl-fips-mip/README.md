# glibc-openssl-fips-mip

This image contains Chainguard FIPS provider for OpenSSL. This image contains Validated, Module in Process and Implementation under Test modules. The dev tags also contain additional debug tools and compilers suitable for testing by approved security laboratories to achieve ACVP testing, CAVP testing, CMVP submission, Common Criteria testing. This image maybe used in FedRAMP deployments, assuming suitable documentation is provided as per FedRAMP Policy for Cryptographic Module Selection and Use

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#glibc-openssl-fips-mip

# Load into Docker
nix build .#load-glibc-openssl-fips-mip-to-docker && ./result/bin/load-glibc-openssl-fips-mip-to-docker
```
