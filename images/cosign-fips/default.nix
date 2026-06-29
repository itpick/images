{ mkImage, pkgs, lib, ... }:

# cosign-fips
# Container image packaging nixpkgs.cosign
mkImage {
  drv = pkgs.cosign;
  name = "cosign-fips";
  tag = "v${pkgs.cosign.version}";
  entrypoint = [ (lib.getExe pkgs.cosign) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "cosign-fips";
    "org.opencontainers.image.description" = "cosign-fips container image (nixpkgs.cosign)";
    "org.opencontainers.image.version" = pkgs.cosign.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
