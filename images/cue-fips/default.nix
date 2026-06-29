{ mkImage, pkgs, lib, ... }:

# cue-fips
# Container image packaging nixpkgs.cue
mkImage {
  drv = pkgs.cue;
  name = "cue-fips";
  tag = "v${pkgs.cue.version}";
  entrypoint = [ (lib.getExe pkgs.cue) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cue-fips";
    "org.opencontainers.image.description" = "cue-fips container image (nixpkgs.cue)";
    "org.opencontainers.image.version" = pkgs.cue.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
