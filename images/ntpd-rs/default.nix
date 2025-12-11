{ mkImage, pkgs, lib, ... }:

# ntpd-rs - NTP daemon written in Rust
# https://github.com/pendulum-project/ntpd-rs

mkImage {
  drv = pkgs.ntpd-rs;
  name = "ntpd-rs";
  tag = "v${pkgs.ntpd-rs.version}";
  entrypoint = [ "${pkgs.ntpd-rs}/bin/ntp-daemon" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ntpd-rs";
    "org.opencontainers.image.description" = "Full-featured NTP daemon written in Rust";
    "org.opencontainers.image.version" = pkgs.ntpd-rs.version;
  };
}
