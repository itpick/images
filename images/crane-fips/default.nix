{ mkImage, pkgs, lib, ... }:

# crane-fips
# Container image packaging nixpkgs.crane
mkImage {
  drv = pkgs.crane;
  name = "crane-fips";
  tag = "v${pkgs.crane.version}";
  entrypoint = [ (lib.getExe pkgs.crane) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "crane-fips";
    "org.opencontainers.image.description" = "crane-fips container image (nixpkgs.crane)";
    "org.opencontainers.image.version" = pkgs.crane.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
