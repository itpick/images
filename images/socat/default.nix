{ mkImage, pkgs, lib, ... }:

# socat - Multipurpose relay tool
# http://www.dest-unreach.org/socat/

mkImage {
  drv = pkgs.socat;
  name = "socat";
  tag = "v${pkgs.socat.version}";
  entrypoint = [ "${pkgs.socat}/bin/socat" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "socat";
    "org.opencontainers.image.description" = "Multipurpose relay for bidirectional data transfer";
    "org.opencontainers.image.version" = pkgs.socat.version;
  };
}
