# gitlab-runner-helper

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 704.06 MB |
| Uncompressed | ~1.71 GB |

## Usage

```bash
# Build the image
nix build .#gitlab-runner-helper

# Load into Docker
nix build .#load-gitlab-runner-helper-to-docker && ./result/bin/load-gitlab-runner-helper-to-docker
```
