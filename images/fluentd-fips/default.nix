{ mkImage, pkgs, lib, ... }:

# fluentd-fips
# Container image packaging nixpkgs.fluentd
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd-fips";
  tag = "v${pkgs.fluentd.version}";
  entrypoint = [ (lib.getExe pkgs.fluentd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fluentd-fips";
    "org.opencontainers.image.description" = "fluentd-fips container image (nixpkgs.fluentd)";
    "org.opencontainers.image.version" = pkgs.fluentd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
