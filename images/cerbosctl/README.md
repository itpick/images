# cerbosctl

Cerbos is the open core, language-agnostic, scalable authorization solution that makes user permissions and authorization simple to implement and manage by writing context-aware access control policies for your application resources

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#cerbosctl

# Load into Docker
nix build .#load-cerbosctl-to-docker && ./result/bin/load-cerbosctl-to-docker
```
