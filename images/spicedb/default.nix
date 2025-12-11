{ mkImage, pkgs, lib, ... }:

# SpiceDB - Open source permission database
# https://authzed.com/spicedb

mkImage {
  drv = pkgs.spicedb;
  name = "spicedb";
  tag = "v${pkgs.spicedb.version}";
  entrypoint = [ "${pkgs.spicedb}/bin/spicedb" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [
    grpc-health-probe
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "SpiceDB";
    "org.opencontainers.image.description" = "Open source permission database inspired by Google Zanzibar";
    "org.opencontainers.image.version" = pkgs.spicedb.version;
  };
}
