# rabbitmq-nixchart-fips

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-nixchart-fips

# Load into Docker
nix build .#load-rabbitmq-nixchart-fips-to-docker && ./result/bin/load-rabbitmq-nixchart-fips-to-docker
```
