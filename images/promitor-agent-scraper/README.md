# promitor-agent-scraper

Promitor is an Azure Monitor scraper which makes the metrics available through a scraping endpoint for Prometheus or push to a StatsD server

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#promitor-agent-scraper

# Load into Docker
nix build .#load-promitor-agent-scraper-to-docker && ./result/bin/load-promitor-agent-scraper-to-docker
```
