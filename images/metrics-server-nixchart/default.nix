{ mkImage, pkgs, lib, ... }:

# metrics-server-nixchart
# Runs Kubernetes metrics-server; chart supplies flags via values.args.
mkImage {
  drv = pkgs.metrics-server;
  name = "metrics-server-nixchart";
  tag = "v${pkgs.metrics-server.version}";
  entrypoint = [ (lib.getExe pkgs.metrics-server) ];
  cmd = [];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "metrics-server-nixchart";
    "org.opencontainers.image.description" = "metrics-server tuned for the nix-containers charts/metrics-server chart";
    "org.opencontainers.image.version" = pkgs.metrics-server.version;
    "io.nix-containers.chart" = "metrics-server";
  };
}
