{ mkImage, pkgs, lib, ... }:

# FRRouting - IP routing protocol suite
# https://frrouting.org/

mkImage {
  drv = pkgs.frr;
  name = "frr";
  tag = "v${pkgs.frr.version}";
  entrypoint = [ "${pkgs.frr}/bin/zebra" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "FRRouting";
    "org.opencontainers.image.description" = "IP routing protocol suite (BGP, OSPF, IS-IS, etc)";
    "org.opencontainers.image.version" = pkgs.frr.version;
  };
}
