# vaultwarden

Unofficial Bitwarden-compatible server written in Rust. Lightweight reimplementation of the Bitwarden API.

## Build

```
nix build .#vaultwarden
```

## Source

- Upstream: https://github.com/dani-garcia/vaultwarden
- nixpkgs: `pkgs.vaultwarden`

## Ports

- `80/tcp` — HTTP API
- `3012/tcp` — WebSocket notifications

## Persistent data

Mount a volume at `/data` for database and attachment storage.

## Required environment

- `DOMAIN` — public URL (e.g. `https://vault.example.com`)
- `ADMIN_TOKEN` — optional; enables the `/admin` panel
