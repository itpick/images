# pomerium

Identity-aware proxy that enables zero-trust access to applications. Pomerium
integrates with identity providers (Google, Okta, GitHub, etc.) to authenticate
and authorize every request to your internal services, without a VPN.

## Source

- Upstream: https://github.com/pomerium/pomerium
- nixpkgs: `pkgs.pomerium`

## Build

```
nix build .#pomerium
```

## Ports

- `443/tcp` — HTTPS proxy listener

## Persistent data

Pomerium is stateless by default. Session state is stored in signed cookies or
an external databroker (Redis). Mount storage only if using a databroker.

## Required environment

- `IDP_CLIENT_ID` — OAuth client ID from your identity provider
- `IDP_CLIENT_SECRET` — OAuth client secret
- `COOKIE_SECRET` — random 32-byte base64 value (session cookie signing)
- `CONFIG_FILE` (or bind-mount `/etc/pomerium/config.yaml`) — policy and route config

See https://www.pomerium.com/docs/reference for full configuration reference.
