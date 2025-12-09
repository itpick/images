{ mkImage, pkgs, lib, ... }:

# Uses cert-manager package from pkgs/cert-manager
# https://github.com/cert-manager/cert-manager

let
  cert-manager = pkgs.cert-manager;
  version = cert-manager.version;
in
mkImage {
  drv = cert-manager;
  name = "cert-manager-acmesolver";
  tag = "v${version}";
  entrypoint = [ "${cert-manager}/bin/cert-manager-acmesolver" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager ACME Solver";
    "org.opencontainers.image.description" = "HTTP-01 challenge solver for cert-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
