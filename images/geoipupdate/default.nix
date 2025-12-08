{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.geoipupdate;
  name = "geoipupdate";
  tag = "v${pkgs.geoipupdate.version}";
  entrypoint = [ "${pkgs.geoipupdate}/bin/geoipupdate" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "GeoIP Update";
    "org.opencontainers.image.description" = "Automatic updates of MaxMind GeoIP databases";
    "org.opencontainers.image.version" = pkgs.geoipupdate.version;
    "io.nix-containers.chart" = "alloy";
  };
}
