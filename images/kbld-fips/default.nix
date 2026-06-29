{ mkImage, pkgs, lib, ... }:

# kbld-fips
# Container image packaging nixpkgs.kbld
mkImage {
  drv = pkgs.kbld;
  name = "kbld-fips";
  tag = "v${pkgs.kbld.version}";
  entrypoint = [ (lib.getExe pkgs.kbld) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "kbld-fips";
    "org.opencontainers.image.description" = "kbld-fips container image (nixpkgs.kbld)";
    "org.opencontainers.image.version" = pkgs.kbld.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
