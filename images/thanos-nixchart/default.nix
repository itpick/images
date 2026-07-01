{ mkImage, pkgs, lib, ... }:

# thanos-nixchart
# Container image packaging nixpkgs.thanos
mkImage {
  drv = pkgs.thanos;
  name = "thanos-nixchart";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-nixchart";
    "org.opencontainers.image.description" = "thanos-nixchart container image (nixpkgs.thanos)";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
