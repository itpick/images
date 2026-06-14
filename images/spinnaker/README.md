# spinnaker (halyard)

Spinnaker installation tool (halyard) — used to deploy and manage Spinnaker
installations. Halyard manages the Spinnaker lifecycle: initial deployment,
configuration changes, rollbacks, and version upgrades.

## This is halyard, NOT Spinnaker proper

Spinnaker itself is composed of 10+ microservices. Halyard is the *installer
and configuration tool* for those services, not the services themselves.

The full Spinnaker microservice set includes:
clouddriver, deck, echo, fiat, front50, gate, igor, kayenta, orca, rosco
(plus spin CLI, redis, and optional monitoring daemons).

For a production Spinnaker deployment use the official `spinnaker/spinnaker`
Helm chart or Armory's distribution — which references each microservice image
independently.

## Registry note (GAR)

The upstream halyard image is hosted on Google Artifact Registry at
`us-docker.pkg.dev/spinnaker-community/docker/halyard`, not Docker Hub.
`nix2container.pullImage` uses skopeo, which supports non-docker.io registries
via a full `registry/path` prefix. The `default.nix` attempts this directly.

If the build fails with an authentication error (GAR may require credentials
for public pulls in some environments), mirror the image to Docker Hub first:

```
skopeo copy \
  docker://us-docker.pkg.dev/spinnaker-community/docker/halyard:1.61.0 \
  docker://docker.io/<your-org>/halyard:1.61.0
```

Then update `imageName` in `default.nix` to point to the mirror.

## Build strategy

This image uses `nix2container.pullImage` to reuse the upstream Docker image
and re-wrap it with standard labels.
The `sha256` field is a placeholder — the first `nix build` will fail with the
correct hash; update `default.nix` and re-run.

## Source

- Upstream: https://github.com/spinnaker/halyard
- GAR: `us-docker.pkg.dev/spinnaker-community/docker/halyard`

## Build

```
nix build .#spinnaker
```
