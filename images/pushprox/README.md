# pushprox

PushProx is a client and proxy that allows transversing of NAT and other similar network topologies by Prometheus

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pushprox

# Load into Docker
nix build .#load-pushprox-to-docker && ./result/bin/load-pushprox-to-docker
```
