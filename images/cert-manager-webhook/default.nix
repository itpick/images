{ mkImage, pkgs, lib, ... }:

# Uses cert-manager package from pkgs/cert-manager
# https://github.com/cert-manager/cert-manager

let
  cert-manager = pkgs.cert-manager;
  version = cert-manager.version;
in
mkImage {
  drv = cert-manager;
  name = "cert-manager-webhook";
  tag = "v${version}";
  entrypoint = [ "${cert-manager}/bin/cert-manager-webhook" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Webhook";
    "org.opencontainers.image.description" = "Validating and mutating webhook for cert-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
