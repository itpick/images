{ mkImage, pkgs, lib, ... }:

# zipkin-slim
# Container image packaging nixpkgs.zipkin
mkImage {
  drv = pkgs.zipkin;
  name = "zipkin-slim";
  tag = "v${pkgs.zipkin.version}";
  entrypoint = [ (lib.getExe pkgs.zipkin) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "zipkin-slim";
    "org.opencontainers.image.description" = "zipkin-slim container image (nixpkgs.zipkin)";
    "org.opencontainers.image.version" = pkgs.zipkin.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
