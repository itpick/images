{ mkImage, pkgs, lib, ... }:

# rsyslog - Rocket-fast system for log processing
# https://www.rsyslog.com/

mkImage {
  drv = pkgs.rsyslog;
  name = "rsyslog";
  tag = "v${pkgs.rsyslog.version}";
  entrypoint = [ "${pkgs.rsyslog}/bin/rsyslogd" ];
  cmd = [ "-n" ];

  labels = {
    "org.opencontainers.image.title" = "rsyslog";
    "org.opencontainers.image.description" = "Rocket-fast system for log processing";
    "org.opencontainers.image.version" = pkgs.rsyslog.version;
  };
}
