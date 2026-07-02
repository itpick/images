{ mkImage, pkgs, lib, ... }:

# Same override as kuma-cp/default.nix — nixpkgs kumactl 2.12.3 bundles
# pgx v5.7.6 (4 crit CVEs); 2.14.0 pulls pgx v5.9.2.

let
  kuma = pkgs.kumactl.overrideAttrs (o: rec {
    version = "2.14.0";
    src = pkgs.fetchFromGitHub {
      owner = "kumahq";
      repo = "kuma";
      rev = "v${version}";
      hash = "sha256-DJDhbxPQ2pZz40KYWcL6nYfoXPv8ETE+Mh80baOqNJo=";
    };
    vendorHash = "sha256-zxNNibPkfHdtywOqQhAR1djAzMPscnLCa6L7bvLjdMw=";
  });
in
mkImage {
  drv = kuma;
  name = "kumactl";
  tag = "v${kuma.version}";
  entrypoint = [ "${kuma}/bin/kumactl" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "kumactl";
    "org.opencontainers.image.description" = "Kuma service mesh (kumactl)";
    "org.opencontainers.image.version" = kuma.version;
    "io.nix-containers.source" = "nixpkgs+override";
  };
}
