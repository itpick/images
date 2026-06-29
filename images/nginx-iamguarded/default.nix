{ mkImage, pkgs, lib, ... }:

# nginx-iamguarded
# Container image packaging nixpkgs.nginx
mkImage {
  drv = pkgs.nginx;
  name = "nginx-iamguarded";
  tag = "v${pkgs.nginx.version}";
  entrypoint = [ (lib.getExe pkgs.nginx) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nginx-iamguarded";
    "org.opencontainers.image.description" = "nginx-iamguarded container image (nixpkgs.nginx)";
    "org.opencontainers.image.version" = pkgs.nginx.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
