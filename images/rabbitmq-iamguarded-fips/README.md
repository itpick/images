# rabbitmq-iamguarded-fips

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-iamguarded-fips

# Load into Docker
nix build .#load-rabbitmq-iamguarded-fips-to-docker && ./result/bin/load-rabbitmq-iamguarded-fips-to-docker
```
