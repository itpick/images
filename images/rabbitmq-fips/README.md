# rabbitmq-fips

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-fips

# Load into Docker
nix build .#load-rabbitmq-fips-to-docker && ./result/bin/load-rabbitmq-fips-to-docker
```
