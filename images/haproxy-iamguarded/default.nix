{ mkImage, pkgs, lib, ... }:

# haproxy-iamguarded
# Container image packaging nixpkgs.haproxy
mkImage {
  drv = pkgs.haproxy;
  name = "haproxy-iamguarded";
  tag = "v${pkgs.haproxy.version}";
  entrypoint = [ (lib.getExe pkgs.haproxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "haproxy-iamguarded";
    "org.opencontainers.image.description" = "haproxy-iamguarded container image (nixpkgs.haproxy)";
    "org.opencontainers.image.version" = pkgs.haproxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
