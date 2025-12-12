{ mkImage, pkgs, lib, ... }:

# iproute2 - Linux networking utilities
# https://wiki.linuxfoundation.org/networking/iproute2

mkImage {
  drv = pkgs.iproute2;
  name = "iproute2";
  tag = "v${pkgs.iproute2.version}";
  entrypoint = [ "${pkgs.iproute2}/bin/ip" ];
  cmd = [ "-V" ];

  labels = {
    "org.opencontainers.image.title" = "iproute2";
    "org.opencontainers.image.description" = "Linux networking utilities (ip, ss, tc, etc.)";
    "org.opencontainers.image.version" = pkgs.iproute2.version;
  };
}
