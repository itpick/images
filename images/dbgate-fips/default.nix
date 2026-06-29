{ mkImage, pkgs, lib, ... }:

# dbgate-fips
# Container image packaging nixpkgs.dbgate
mkImage {
  drv = pkgs.dbgate;
  name = "dbgate-fips";
  tag = "v${pkgs.dbgate.version}";
  entrypoint = [ (lib.getExe pkgs.dbgate) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dbgate-fips";
    "org.opencontainers.image.description" = "dbgate-fips container image (nixpkgs.dbgate)";
    "org.opencontainers.image.version" = pkgs.dbgate.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
