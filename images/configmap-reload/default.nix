{ mkImage, pkgs, lib, ... }:

# Uses configmap-reload package from pkgs/configmap-reload
# Built from wolfi-dev/os configmap-reload.yaml
# https://github.com/jimmidyson/configmap-reload

let
  configmap-reload = pkgs.configmap-reload;
  version = configmap-reload.version;
in
mkImage {
  drv = configmap-reload;
  name = "configmap-reload";
  tag = "v${version}";
  entrypoint = [ "${configmap-reload}/bin/configmap-reload" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "ConfigMap Reload";
    "org.opencontainers.image.description" = "Watches ConfigMaps and triggers reloads";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
