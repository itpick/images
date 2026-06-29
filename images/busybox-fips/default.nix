{ mkImage, pkgs, lib, ... }:

# busybox-fips
# Container image packaging nixpkgs.busybox
mkImage {
  drv = pkgs.busybox;
  name = "busybox-fips";
  tag = "v${pkgs.busybox.version}";
  entrypoint = [ (lib.getExe pkgs.busybox) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "busybox-fips";
    "org.opencontainers.image.description" = "busybox-fips container image (nixpkgs.busybox)";
    "org.opencontainers.image.version" = pkgs.busybox.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
