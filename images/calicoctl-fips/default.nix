{ mkImage, pkgs, lib, ... }:

# calicoctl-fips
# Container image packaging nixpkgs.calicoctl
mkImage {
  drv = pkgs.calicoctl;
  name = "calicoctl-fips";
  tag = "v${pkgs.calicoctl.version}";
  entrypoint = [ (lib.getExe pkgs.calicoctl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "calicoctl-fips";
    "org.opencontainers.image.description" = "calicoctl-fips container image (nixpkgs.calicoctl)";
    "org.opencontainers.image.version" = pkgs.calicoctl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
