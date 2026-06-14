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
  version = "v1.18.5";

  upstreamImage = nix2container.pullImage {
    imageName   = "rook/ceph";
    imageDigest = "sha256:b76f9fdb4154939c7896466d6d1d6cce1cf02c232d5dcf97ce9603107ab4c426";
    sha256      = "sha256-9WXIovuuj+y+MOtM8D3Zx2ykOmoiylQz5PWmrVvLkwU=";
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
