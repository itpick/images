# logstash-8.19-env2yaml

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#logstash-8.19-env2yaml

# Load into Docker
nix build .#load-logstash-8.19-env2yaml-to-docker && ./result/bin/load-logstash-8.19-env2yaml-to-docker
```
