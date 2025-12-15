# metricbeat

Metricbeat fetches a set of metrics on a predefined interval from the operating system and services such as Apache web server, Redis, and more and ships them to Elasticsearch or Logstash

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#metricbeat

# Load into Docker
nix build .#load-metricbeat-to-docker && ./result/bin/load-metricbeat-to-docker
```
