{ mkImage, pkgs, lib, ... }:

# Squid - Caching proxy
# http://www.squid-cache.org/

mkImage {
  drv = pkgs.squid;
  name = "squid";
  tag = "v${pkgs.squid.version}";
  entrypoint = [ "${pkgs.squid}/bin/squid" ];
  cmd = [ "-N" "-d" "1" ];

  labels = {
    "org.opencontainers.image.title" = "Squid";
    "org.opencontainers.image.description" = "Caching proxy for the web";
    "org.opencontainers.image.version" = pkgs.squid.version;
  };
}
