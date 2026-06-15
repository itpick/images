{ mkImage, pkgs, lib, ... }:

# Uses keda package from pkgs/keda
# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda

let
  keda = pkgs.keda;
  version = keda.version;
  # The keda helm chart hardcodes `command: ["/keda"]` on the operator
  # Deployment. Upstream's kedacore/keda image ships the binary at
  # exactly that path; our nix-containers image ships it under
  # ${keda}/bin/keda. Without a top-level symlink the container crashes
  # at start with `exec: "/keda": no such file or directory`. Same
  # pattern as victoriametrics-vmauth's /vmauth-prod fix.
  cmdCompat = pkgs.runCommand "keda-cmd-compat" {} ''
    mkdir -p $out
    ln -s ${keda}/bin/keda $out/keda
  '';
in
mkImage {
  drv = keda;
  name = "keda";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];
  extraContents = [ cmdCompat ];

  labels = {
    "org.opencontainers.image.title" = "KEDA";
    "org.opencontainers.image.description" = "Kubernetes Event-driven Autoscaling";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
