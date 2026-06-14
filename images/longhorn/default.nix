# longhorn
# ========
# Cloud-native distributed block storage for Kubernetes — manager controller
# https://github.com/longhorn/longhorn
#
# Build strategy: nix2container.pullImage (re-wrap upstream Docker image)
# -----------------------------------------------------------------------
# Longhorn manager is the main controller that manages Longhorn volumes.
# We pull the upstream image and re-wrap it with our standard labels.
#
# NOTE: Longhorn deploys as multiple images — manager, engine,
# instance-manager, share-manager, and UI. This image is the manager only.
# See README.md for the full list.
#
# sha256 is the NAR hash of the pulled image directory — refresh with:
#   nix build --no-link .#longhorn 2>&1 | grep "got:"

{ nix2container, pkgs, lib, ... }:

let
  version = "v1.10.0";

  upstreamImage = nix2container.pullImage {
    imageName   = "longhornio/longhorn-manager";
    imageDigest = "sha256:5b0bc1b88f0cda9b335f57a733df33e44da4138dd9a86f1d5a115e8ceed04a02";
    sha256      = "sha256-BYDFN1Z8i5yodFGajuZZldJy2MFLIZm/SQ4ZcFgvF3E=";
  };

in
nix2container.buildImage {
  name      = "longhorn";
  tag       = version;
  fromImage = upstreamImage;

  config = {
    Labels = {
      "org.opencontainers.image.title"       = "Longhorn Manager";
      "org.opencontainers.image.description" = "Cloud-native distributed block storage for Kubernetes — manager controller";
      "org.opencontainers.image.version"     = version;
      "org.opencontainers.image.source"      = "https://github.com/longhorn/longhorn";
      "io.nix-containers.build-strategy"     = "nix2container-pullImage";
      "io.nix-containers.upstream-image"     = "docker.io/longhornio/longhorn-manager:${version}";
    };
  };
}
