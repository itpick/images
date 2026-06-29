{ mkImage, pkgs, lib, ... }:

# haproxy-fips
# Container image packaging nixpkgs.haproxy
mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-fips";
  tag = "v${pkgs.haproxy.version}";
  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "haproxy-fips";
    "org.opencontainers.image.description" = "haproxy-fips container image (nixpkgs.haproxy)";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
