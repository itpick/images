{ mkImage, pkgs, lib, ... }:

# thanos-iamguarded
# Container image packaging nixpkgs.thanos
mkImage {
  drv = pkgs.thanos;
  name = "thanos-iamguarded";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ (lib.getExe pkgs.thanos) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "thanos-iamguarded";
    "org.opencontainers.image.description" = "thanos-iamguarded container image (nixpkgs.thanos)";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
