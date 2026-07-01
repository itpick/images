{ mkImage, pkgs, lib, ... }:

# nginx-nixchart
# Container image packaging nixpkgs.nginx
mkImage {
  drv = pkgs.nginx;
  name = "nginx-nixchart";
  tag = "v${pkgs.nginx.version}";
  entrypoint = [ (lib.getExe pkgs.nginx) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "nginx-nixchart";
    "org.opencontainers.image.description" = "nginx-nixchart container image (nixpkgs.nginx)";
    "org.opencontainers.image.version" = pkgs.nginx.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
