{ mkImage, pkgs, lib, ... }:

# Kuma Control Plane - Service mesh controller
# https://kuma.io/
#
# nixpkgs kuma-cp 2.12.3 bundles jackc/pgx v5.7.6 with 4 crit CVEs.
# Override to 2.14.0 which pulls pgx v5.9.2.

let
  kuma = pkgs.kuma-cp.overrideAttrs (o: rec {
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
  name = "kuma-cp";
  tag = "v${kuma.version}";
  entrypoint = [ "${kuma}/bin/kuma-cp" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kuma Control Plane";
    "org.opencontainers.image.description" = "Universal service mesh control plane";
    "org.opencontainers.image.version" = kuma.version;
    "io.nix-containers.source" = "nixpkgs+override";
  };
}
