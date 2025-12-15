# gitlab-toolbox-ce-fips

FIPS-compliant GitLab images providing a complete DevOps platform that meets Federal Information Processing Standards for cryptographic operations, source code management, CI/CD automation, and collaboration tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-toolbox-ce-fips

# Load into Docker
nix build .#load-gitlab-toolbox-ce-fips-to-docker && ./result/bin/load-gitlab-toolbox-ce-fips-to-docker
```
