{ mkImage, pkgs, lib, ... }:

# psqlodbc
# Container image packaging nixpkgs.psqlodbc
mkImage {
  drv = pkgs.psqlodbc;
  name = "psqlodbc";
  tag = "v${pkgs.psqlodbc.version}";
  entrypoint = [ (lib.getExe pkgs.psqlodbc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "psqlodbc";
    "org.opencontainers.image.description" = "psqlodbc container image (nixpkgs.psqlodbc)";
    "org.opencontainers.image.version" = pkgs.psqlodbc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
