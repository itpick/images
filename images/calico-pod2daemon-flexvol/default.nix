{ mkImage, pkgs, lib, ... }:

# Calico Pod2Daemon Flexvol - FlexVolume driver for Calico
# https://github.com/projectcalico/calico

mkImage {
  drv = pkgs.calico-pod2daemon;
  name = "calico-pod2daemon-flexvol";
  tag = "v${pkgs.calico-pod2daemon.version}";
  entrypoint = [ "${pkgs.calico-pod2daemon}/bin/flexvol" ];
  cmd = [];

  extraPkgs = with pkgs; [ busybox ];

  # FlexVolume drivers run as root
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "Calico Pod2Daemon FlexVol";
    "org.opencontainers.image.description" = "FlexVolume driver for Calico";
    "org.opencontainers.image.version" = pkgs.calico-pod2daemon.version;
    "io.nix-containers.chart" = "tigera-operator";
  };
}
