{ mkImage, pkgs, lib, ... }:

# Uses keda package from pkgs/keda
# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda

let
  keda = pkgs.keda;
  version = keda.version;
  # The keda helm chart hardcodes `command: ["/keda-adapter"]` on the
  # metrics-apiserver Deployment. Add a top-level symlink for chart
  # compatibility — see comment in ../keda/default.nix.
  cmdCompat = pkgs.runCommand "keda-adapter-cmd-compat" {} ''
    mkdir -p $out
    ln -s ${keda}/bin/keda-adapter $out/keda-adapter
  '';
in
mkImage {
  drv = keda;
  name = "keda-metrics-apiserver";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda-adapter" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];
  extraContents = [ cmdCompat ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Metrics API Server";
    "org.opencontainers.image.description" = "Kubernetes custom metrics server for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
