# knative-eventing-1.19-jobsink

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#knative-eventing-1.19-jobsink

# Load into Docker
nix build .#load-knative-eventing-1.19-jobsink-to-docker && ./result/bin/load-knative-eventing-1.19-jobsink-to-docker
```
