{ mkImage, pkgs, lib, ... }:

# multus-cni-fips
# Container image packaging nixpkgs.multus-cni
mkImage {
  drv = pkgs.multus-cni;
  name = "multus-cni-fips";
  tag = "v${pkgs.multus-cni.version}";
  entrypoint = [ (lib.getExe pkgs.multus-cni) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "multus-cni-fips";
    "org.opencontainers.image.description" = "multus-cni-fips container image (nixpkgs.multus-cni)";
    "org.opencontainers.image.version" = pkgs.multus-cni.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
