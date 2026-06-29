{ mkImage, pkgs, lib, ... }:

# sbt-fips
# Container image packaging nixpkgs.sbt
mkImage {
  drv = pkgs.sbt;
  name = "sbt-fips";
  tag = "v${pkgs.sbt.version}";
  entrypoint = [ (lib.getExe pkgs.sbt) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "sbt-fips";
    "org.opencontainers.image.description" = "sbt-fips container image (nixpkgs.sbt)";
    "org.opencontainers.image.version" = pkgs.sbt.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
