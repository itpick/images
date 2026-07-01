{ mkImage, pkgs, lib, ... }:

# haproxy-nixchart-fips
# Container image packaging nixpkgs.haproxy
mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-nixchart-fips";
  tag = "v${pkgs.haproxy.version}";
  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "haproxy-nixchart-fips";
    "org.opencontainers.image.description" = "haproxy-nixchart-fips container image (nixpkgs.haproxy)";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
