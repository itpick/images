{ mkImage, pkgs, lib, ... }:

# haproxy-nixchart
# Container image packaging nixpkgs.haproxy
mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-nixchart";
  tag = "v${pkgs.haproxy.version}";
  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "haproxy-nixchart";
    "org.opencontainers.image.description" = "haproxy-nixchart container image (nixpkgs.haproxy)";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
