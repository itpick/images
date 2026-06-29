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
  # Was empty — but configmap-reload exits ("missing volume-dir") with no args,
  # so the bare image CrashLoops (e.g. as the alloy/kube-prometheus-stack
  # sidecar when the chart leaves command unset). Provide a runnable default:
  # watch /tmp, expose the metrics/health server on 0.0.0.0:9533, with a
  # self-referential webhook. Operators override --volume-dir / --webhook-url
  # for their actual ConfigMap mount + reload target.
  cmd = [
    "--volume-dir=/tmp"
    "--web.listen-address=0.0.0.0:9533"
    "--webhook-url=http://localhost:9533/-/reload"
  ];

  labels = {
    "org.opencontainers.image.title" = "ConfigMap Reload";
    "org.opencontainers.image.description" = "Watches ConfigMaps and triggers reloads";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
