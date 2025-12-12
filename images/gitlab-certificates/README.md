# gitlab-certificates

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 190.26 MB |
| Uncompressed | ~475.67 MB |

## Usage

```bash
# Build the image
nix build .#gitlab-certificates

# Load into Docker
nix build .#load-gitlab-certificates-to-docker && ./result/bin/load-gitlab-certificates-to-docker
```
