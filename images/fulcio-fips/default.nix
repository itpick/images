{ mkImage, pkgs, lib, ... }:

# fulcio-fips
# Container image packaging nixpkgs.fulcio
mkImage {
  drv = pkgs.fulcio;
  name = "fulcio-fips";
  tag = "v${pkgs.fulcio.version}";
  entrypoint = [ (lib.getExe pkgs.fulcio) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "fulcio-fips";
    "org.opencontainers.image.description" = "fulcio-fips container image (nixpkgs.fulcio)";
    "org.opencontainers.image.version" = pkgs.fulcio.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
