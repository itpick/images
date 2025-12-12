{ mkImage, pkgs, lib, ... }:

# iptables - Linux firewall administration
# https://www.netfilter.org/projects/iptables/

mkImage {
  drv = pkgs.iptables;
  name = "iptables";
  tag = "v${pkgs.iptables.version}";
  entrypoint = [ "${pkgs.iptables}/bin/iptables" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "iptables";
    "org.opencontainers.image.description" = "Linux kernel packet filtering framework";
    "org.opencontainers.image.version" = pkgs.iptables.version;
  };
}
