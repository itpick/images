# spinnaker (halyard)
# ===================
# Spinnaker installation tool (halyard) — used to deploy and manage Spinnaker installations
# https://github.com/spinnaker/halyard
#
# Build strategy: nix2container.pullImage (re-wrap upstream image from GAR)
# -------------------------------------------------------------------------
# Halyard is distributed on Google Artifact Registry (us-docker.pkg.dev),
# not Docker Hub. nix2container.pullImage uses skopeo under the hood, which
# supports non-docker.io registries via a full registry prefix in imageName.
#
# NOTE: Spinnaker itself is 10+ microservices (clouddriver, deck, echo,
# fiat, front50, gate, igor, kayenta, orca, rosco). This image is the
# *halyard* deployer/management tool only, not Spinnaker proper.
# See README.md for the full list of microservice images.
#
# TODO: If the build fails with an authentication error (GAR requires auth
# for some images), mirror the image to Docker Hub and update imageName.
# Use: skopeo copy --dest-creds <user>:<token> \
#   docker://us-docker.pkg.dev/spinnaker-community/docker/halyard:1.61.0 \
#   docker://docker.io/<your-org>/halyard:1.61.0
#
# sha256 is the NAR hash of the pulled image directory — refresh with:
#   nix build --no-link .#spinnaker 2>&1 | grep "got:"

{ nix2container, pkgs, lib, ... }:

let
  version = "1.61.0";

  upstreamImage = nix2container.pullImage {
    imageName   = "us-docker.pkg.dev/spinnaker-community/docker/halyard";
    imageDigest = "sha256:f656b354f743412c5acf77b890c27e403747814a75f2982f70e5c37e74c8f46a";
    sha256      = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

in
nix2container.buildImage {
  name      = "spinnaker";
  tag       = "v${version}";
  fromImage = upstreamImage;

  config = {
    Labels = {
      "org.opencontainers.image.title"       = "Spinnaker Halyard";
      "org.opencontainers.image.description" = "Spinnaker installation tool (halyard) — used to deploy and manage Spinnaker installations";
      "org.opencontainers.image.version"     = version;
      "org.opencontainers.image.source"      = "https://github.com/spinnaker/halyard";
      "io.nix-containers.build-strategy"     = "nix2container-pullImage";
      "io.nix-containers.upstream-image"     = "us-docker.pkg.dev/spinnaker-community/docker/halyard:${version}";
    };
  };
}
