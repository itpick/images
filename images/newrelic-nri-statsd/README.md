# newrelic-nri-statsd

The StatsD integration lets you easily get StatsD data into New Relic

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#newrelic-nri-statsd

# Load into Docker
nix build .#load-newrelic-nri-statsd-to-docker && ./result/bin/load-newrelic-nri-statsd-to-docker
```
