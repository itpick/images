# eclipse-mosquitto

Eclipse Mosquitto - An open source MQTT broker

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#eclipse-mosquitto

# Load into Docker
nix build .#load-eclipse-mosquitto-to-docker && ./result/bin/load-eclipse-mosquitto-to-docker
```
