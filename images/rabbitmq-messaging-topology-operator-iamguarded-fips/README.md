# rabbitmq-messaging-topology-operator-iamguarded-fips

RabbitMQ messaging topology operator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#rabbitmq-messaging-topology-operator-iamguarded-fips

# Load into Docker
nix build .#load-rabbitmq-messaging-topology-operator-iamguarded-fips-to-docker && ./result/bin/load-rabbitmq-messaging-topology-operator-iamguarded-fips-to-docker
```
