# rook
# ====
# Storage operator for Kubernetes — Rook Ceph operator that manages Ceph storage clusters
# https://github.com/rook/rook
#
# Build strategy: nix2container.pullImage (re-wrap upstream Docker image)
# -----------------------------------------------------------------------
# The Rook Ceph operator manages Ceph cluster lifecycle in Kubernetes.
# We pull the upstream image and re-wrap it with our standard labels.
#
# NOTE: This is the Rook operator only. Running a full Ceph cluster also
# requires the Ceph cluster images (ceph/ceph). See README.md.
#
# sha256 is the NAR hash of the pulled image directory — refresh with:
#   nix build --no-link .#rook 2>&1 | grep "got:"

{ nix2container, pkgs, lib, ... }:

let
  version = "v1.20.1";

  upstreamImage = nix2container.pullImage {
    imageName   = "rook/ceph";
    imageDigest = "sha256:ff1260dd0d015cb09d7ac607a8adfa8ca3e8f1a89144c8d1842d1ee43b1bd344";
    sha256      = "sha256-wN6zrR4+Am0KnN4kj26bMtK0jsDuMEMnjHkpkcCsF88=";
  };

in
nix2container.buildImage {
  name      = "rook";
  tag       = version;
  fromImage = upstreamImage;

  config = {
    Labels = {
      "org.opencontainers.image.title"       = "Rook Ceph Operator";
      "org.opencontainers.image.description" = "Storage operator for Kubernetes — Rook Ceph operator that manages Ceph storage clusters";
      "org.opencontainers.image.version"     = version;
      "org.opencontainers.image.source"      = "https://github.com/rook/rook";
      "io.nix-containers.build-strategy"     = "nix2container-pullImage";
      "io.nix-containers.upstream-image"     = "docker.io/rook/ceph:${version}";
    };
  };
}
