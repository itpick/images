{ mkImage, pkgs, lib, ... }:

# Wireshark - Network protocol analyzer
# https://www.wireshark.org/

mkImage {
  drv = pkgs.wireshark;
  name = "wireshark";
  tag = "v${pkgs.wireshark.version}";
  entrypoint = [ "${pkgs.wireshark}/bin/tshark" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Wireshark";
    "org.opencontainers.image.description" = "Powerful network protocol analyzer";
    "org.opencontainers.image.version" = pkgs.wireshark.version;
  };
}
