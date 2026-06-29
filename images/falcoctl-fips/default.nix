{ mkImage, pkgs, lib, ... }:

# falcoctl-fips
# Container image packaging nixpkgs.falcoctl
mkImage {
  drv = pkgs.falcoctl;
  name = "falcoctl-fips";
  tag = "v${pkgs.falcoctl.version}";
  entrypoint = [ (lib.getExe pkgs.falcoctl) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "falcoctl-fips";
    "org.opencontainers.image.description" = "falcoctl-fips container image (nixpkgs.falcoctl)";
    "org.opencontainers.image.version" = pkgs.falcoctl.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
