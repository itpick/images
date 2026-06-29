{ mkImage, pkgs, lib, ... }:

# psqlodbc-fips
# Container image packaging nixpkgs.psqlodbc
mkImage {
  drv = pkgs.psqlodbc;
  name = "psqlodbc-fips";
  tag = "v${pkgs.psqlodbc.version}";
  entrypoint = [ (lib.getExe pkgs.psqlodbc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "psqlodbc-fips";
    "org.opencontainers.image.description" = "psqlodbc-fips container image (nixpkgs.psqlodbc)";
    "org.opencontainers.image.version" = pkgs.psqlodbc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
