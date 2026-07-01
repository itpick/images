{ mkImage, pkgs, lib, ... }:

# oauth2-proxy-nixchart
# Runs oauth2-proxy; chart supplies flags via values.args/env.
mkImage {
  drv = pkgs.oauth2-proxy;
  name = "oauth2-proxy-nixchart";
  tag = "v${pkgs.oauth2-proxy.version}";
  entrypoint = [ (lib.getExe pkgs.oauth2-proxy) ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "oauth2-proxy-nixchart";
    "org.opencontainers.image.description" = "oauth2-proxy tuned for the nix-containers charts/oauth2-proxy chart";
    "org.opencontainers.image.version" = pkgs.oauth2-proxy.version;
    "io.nix-containers.chart" = "oauth2-proxy";
  };
}
