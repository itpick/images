# gitlab-workhorse-ce

GitLab is a complete DevOps platform that provides source code management, CI/CD automation, and collaboration tools in a single application for the entire software development lifecycle

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#gitlab-workhorse-ce

# Load into Docker
nix build .#load-gitlab-workhorse-ce-to-docker && ./result/bin/load-gitlab-workhorse-ce-to-docker
```
