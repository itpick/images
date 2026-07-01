# rabbitmq-nixchart

RabbitMQ RabbitMQ is a message broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-nixchart

# Load into Docker
nix build .#load-rabbitmq-nixchart-to-docker && ./result/bin/load-rabbitmq-nixchart-to-docker
```
