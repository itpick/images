{ mkImage, pkgs, lib, ... }:

# auditbeat-fips
# Container image packaging nixpkgs.auditbeat
mkImage {
  drv = pkgs.auditbeat;
  name = "auditbeat-fips";
  tag = "v${pkgs.auditbeat.version}";
  entrypoint = [ (lib.getExe pkgs.auditbeat) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "auditbeat-fips";
    "org.opencontainers.image.description" = "auditbeat-fips container image (nixpkgs.auditbeat)";
    "org.opencontainers.image.version" = pkgs.auditbeat.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
