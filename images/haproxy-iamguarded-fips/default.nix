{ mkImage, pkgs, lib, ... }:

# haproxy-iamguarded-fips
# Container image packaging nixpkgs.haproxy
mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-iamguarded-fips";
  tag = "v${pkgs.haproxy.version}";
  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "haproxy-iamguarded-fips";
    "org.opencontainers.image.description" = "haproxy-iamguarded-fips container image (nixpkgs.haproxy)";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
