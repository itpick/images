{ mkImage, pkgs, lib, ... }:

# Uses cert-manager package from pkgs/cert-manager
# https://github.com/cert-manager/cert-manager

let
  cert-manager = pkgs.cert-manager;
  version = cert-manager.version;
in
mkImage {
  drv = cert-manager;
  name = "cert-manager-controller";
  tag = "v${version}";
  entrypoint = [ "${cert-manager}/bin/cert-manager-controller" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Controller";
    "org.opencontainers.image.description" = "Automatic TLS certificate management controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
