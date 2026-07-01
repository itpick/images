{ mkImage, pkgs, lib, ... }:

# oauth2-proxy-nixchart
# Container image packaging nixpkgs.oauth2-proxy
mkImage {
  drv = pkgs.oauth2-proxy;
  name = "oauth2-proxy-nixchart";
  tag = "v${pkgs.oauth2-proxy.version}";
  entrypoint = [ (lib.getExe pkgs.oauth2-proxy) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "oauth2-proxy-nixchart";
    "org.opencontainers.image.description" = "oauth2-proxy-nixchart container image (nixpkgs.oauth2-proxy)";
    "org.opencontainers.image.version" = pkgs.oauth2-proxy.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
