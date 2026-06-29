{ mkImage, pkgs, lib, ... }:

# fluentd-iamguarded
# Container image packaging nixpkgs.fluentd
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd-iamguarded";
  tag = "v${pkgs.fluentd.version}";
  entrypoint = [ (lib.getExe pkgs.fluentd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fluentd-iamguarded";
    "org.opencontainers.image.description" = "fluentd-iamguarded container image (nixpkgs.fluentd)";
    "org.opencontainers.image.version" = pkgs.fluentd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
