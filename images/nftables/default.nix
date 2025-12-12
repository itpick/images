{ mkImage, pkgs, lib, ... }:

# nftables - Linux packet filtering framework
# https://netfilter.org/projects/nftables/

mkImage {
  drv = pkgs.nftables;
  name = "nftables";
  tag = "v${pkgs.nftables.version}";
  entrypoint = [ "${pkgs.nftables}/bin/nft" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "nftables";
    "org.opencontainers.image.description" = "Modern Linux firewall subsystem";
    "org.opencontainers.image.version" = pkgs.nftables.version;
  };
}
