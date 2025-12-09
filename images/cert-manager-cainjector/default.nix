{ mkImage, pkgs, lib, ... }:

# Uses cert-manager package from pkgs/cert-manager
# https://github.com/cert-manager/cert-manager

let
  cert-manager = pkgs.cert-manager;
  version = cert-manager.version;
in
mkImage {
  drv = cert-manager;
  name = "cert-manager-cainjector";
  tag = "v${version}";
  entrypoint = [ "${cert-manager}/bin/cert-manager-cainjector" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "cert-manager CA Injector";
    "org.opencontainers.image.description" = "CA bundle injector for cert-manager";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "cert-manager";
  };
}
