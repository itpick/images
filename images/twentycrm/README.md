# twentycrm

Twenty — open-source CRM. Re-wrapped from upstream Docker image (`twentycrm/twenty`).

## Build strategy

This image uses `nix2container.pullImage` to reuse the upstream Docker image rather
than rebuilding the Node.js monorepo from source. A true `buildNpmPackage`-based
derivation is a followup.

## Source

- Upstream: https://github.com/twentyhq/twenty
- Docker Hub: https://hub.docker.com/r/twentycrm/twenty
