{ mkImage, pkgs, lib, ... }:

# syft-fips
# Container image packaging nixpkgs.syft
mkImage {
  drv = pkgs.syft;
  name = "syft-fips";
  tag = "v${pkgs.syft.version}";
  entrypoint = [ (lib.getExe pkgs.syft) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "syft-fips";
    "org.opencontainers.image.description" = "syft-fips container image (nixpkgs.syft)";
    "org.opencontainers.image.version" = pkgs.syft.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
