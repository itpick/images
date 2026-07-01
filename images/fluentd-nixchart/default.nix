{ mkImage, pkgs, lib, ... }:

# fluentd-nixchart
# Container image packaging nixpkgs.fluentd
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd-nixchart";
  tag = "v${pkgs.fluentd.version}";
  entrypoint = [ (lib.getExe pkgs.fluentd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fluentd-nixchart";
    "org.opencontainers.image.description" = "fluentd-nixchart container image (nixpkgs.fluentd)";
    "org.opencontainers.image.version" = pkgs.fluentd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
