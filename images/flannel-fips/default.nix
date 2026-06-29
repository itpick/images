{ mkImage, pkgs, lib, ... }:

# flannel-fips
# Container image packaging nixpkgs.flannel
mkImage {
  drv = pkgs.flannel;
  name = "flannel-fips";
  tag = "v${pkgs.flannel.version}";
  entrypoint = [ (lib.getExe pkgs.flannel) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "flannel-fips";
    "org.opencontainers.image.description" = "flannel-fips container image (nixpkgs.flannel)";
    "org.opencontainers.image.version" = pkgs.flannel.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
