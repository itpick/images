{ mkImage, pkgs, lib, ... }:

# tempo-fips
# Container image packaging nixpkgs.tempo
mkImage {
  drv = pkgs.tempo;
  name = "tempo-fips";
  tag = "v${pkgs.tempo.version}";
  entrypoint = [ (lib.getExe pkgs.tempo) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tempo-fips";
    "org.opencontainers.image.description" = "tempo-fips container image (nixpkgs.tempo)";
    "org.opencontainers.image.version" = pkgs.tempo.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
