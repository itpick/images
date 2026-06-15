{ mkImage, pkgs, lib, ... }:

# Uses keda package from pkgs/keda
# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda

let
  keda = pkgs.keda;
  version = keda.version;
  # The keda helm chart hardcodes `command: ["/keda-admission-webhooks"]`
  # on the admission Deployment. Add a top-level symlink for chart
  # compatibility — see comment in ../keda/default.nix.
  cmdCompat = pkgs.runCommand "keda-admission-webhooks-cmd-compat" {} ''
    mkdir -p $out
    ln -s ${keda}/bin/keda-admission-webhooks $out/keda-admission-webhooks
  '';
in
mkImage {
  drv = keda;
  name = "keda-admission-webhooks";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda-admission-webhooks" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];
  extraContents = [ cmdCompat ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Admission Webhooks";
    "org.opencontainers.image.description" = "Admission controller webhooks for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
