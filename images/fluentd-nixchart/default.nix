{ mkImage, pkgs, lib, ... }:

# fluentd-nixchart
# Runs fluentd; chart mounts fluent.conf via ConfigMap.
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd-nixchart";
  tag = "v${pkgs.fluentd.version}";
  entrypoint = [ (lib.getExe pkgs.fluentd) ];
  cmd = [ "-c" "/opt/nix-containers/fluentd/conf/fluent.conf" ];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "fluentd-nixchart";
    "org.opencontainers.image.description" = "fluentd tuned for the nix-containers charts/fluentd chart";
    "org.opencontainers.image.version" = pkgs.fluentd.version;
    "io.nix-containers.chart" = "fluentd";
  };
}
