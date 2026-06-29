{ mkImage, pkgs, lib, ... }:

# mc-fips
# Container image packaging nixpkgs.mc
mkImage {
  drv = pkgs.mc;
  name = "mc-fips";
  tag = "v${pkgs.mc.version}";
  entrypoint = [ (lib.getExe pkgs.mc) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mc-fips";
    "org.opencontainers.image.description" = "mc-fips container image (nixpkgs.mc)";
    "org.opencontainers.image.version" = pkgs.mc.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
