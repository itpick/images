{ mkImage, pkgs, lib, ... }:

# Uses keda package from pkgs/keda
# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda

let
  keda = pkgs.keda;
  version = keda.version;
in
mkImage {
  drv = keda;
  name = "keda-admission-webhooks";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda-admission-webhooks" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ busybox tzdata ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Admission Webhooks";
    "org.opencontainers.image.description" = "Admission controller webhooks for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
