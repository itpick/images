# py3-cassandra-medusa

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#py3-cassandra-medusa

# Load into Docker
nix build .#load-py3-cassandra-medusa-to-docker && ./result/bin/load-py3-cassandra-medusa-to-docker
```
