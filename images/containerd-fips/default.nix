{ mkImage, pkgs, lib, ... }:

# containerd-fips
# Container image packaging nixpkgs.containerd
mkImage {
  drv = pkgs.containerd;
  name = "containerd-fips";
  tag = "v${pkgs.containerd.version}";
  entrypoint = [ (lib.getExe pkgs.containerd) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "containerd-fips";
    "org.opencontainers.image.description" = "containerd-fips container image (nixpkgs.containerd)";
    "org.opencontainers.image.version" = pkgs.containerd.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
