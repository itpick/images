# mcp-grafana

mcp-grafana is a Model Context Protocol (MCP) server for Grafana that enables AI assistants and automation tools to interact with your Grafana dashboards, incidents, alerts, and datasources through a standardized protocol

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mcp-grafana

# Load into Docker
nix build .#load-mcp-grafana-to-docker && ./result/bin/load-mcp-grafana-to-docker
```
