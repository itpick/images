# pyroscope

Continuous profiling platform for application performance. Pyroscope (Grafana
Pyroscope) collects and aggregates continuous profiling data from applications,
allowing you to identify CPU hotspots, memory leaks, and latency bottlenecks
over time.

## Source

- Upstream: https://github.com/grafana/pyroscope
- nixpkgs: `pkgs.pyroscope`

## Build

```
nix build .#pyroscope
```

## Ports

- `4040/tcp` — HTTP API + UI

## Persistent data

Mount a volume at `/var/lib/pyroscope` (or configure `storage.path`) for
profile data persistence.

## Required environment

- `PYROSCOPE_CONFIG` (or bind-mount `/etc/pyroscope/config.yaml`) — server config
- See https://grafana.com/docs/pyroscope/latest/configure-server/ for full reference
