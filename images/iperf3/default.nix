{ mkImage, pkgs, lib, ... }:

# iperf3 - Network bandwidth measurement
# https://iperf.fr/

mkImage {
  drv = pkgs.iperf3;
  name = "iperf3";
  tag = "v${pkgs.iperf3.version}";
  entrypoint = [ "${pkgs.iperf3}/bin/iperf3" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "iperf3";
    "org.opencontainers.image.description" = "Tool to measure IP bandwidth using UDP or TCP";
    "org.opencontainers.image.version" = pkgs.iperf3.version;
  };
}
