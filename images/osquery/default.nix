{ mkImage, pkgs, lib, ... }:

# osquery - SQL-powered operating system instrumentation
# https://osquery.io/

mkImage {
  drv = pkgs.osquery;
  name = "osquery";
  tag = "v${pkgs.osquery.version}";
  entrypoint = [ "${pkgs.osquery}/bin/osqueryi" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "osquery";
    "org.opencontainers.image.description" = "SQL-powered operating system instrumentation";
    "org.opencontainers.image.version" = pkgs.osquery.version;
  };
}
