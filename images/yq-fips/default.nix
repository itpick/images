{ mkImage, pkgs, lib, ... }:

# yq-fips
# Container image packaging nixpkgs.yq
mkImage {
  drv = pkgs.yq;
  name = "yq-fips";
  tag = "v${pkgs.yq.version}";
  entrypoint = [ (lib.getExe pkgs.yq) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "yq-fips";
    "org.opencontainers.image.description" = "yq-fips container image (nixpkgs.yq)";
    "org.opencontainers.image.version" = pkgs.yq.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
