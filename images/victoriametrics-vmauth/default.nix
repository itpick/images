{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmauth - authentication proxy and load balancer
# https://docs.victoriametrics.com/vmauth/

mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmauth";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmauth" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmauth";
    "org.opencontainers.image.description" = "Authentication proxy and load balancer";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-auth";
  };
}
