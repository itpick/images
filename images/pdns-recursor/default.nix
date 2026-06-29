{ mkImage, pkgs, lib, ... }:

# PowerDNS Recursor - High-performance DNS recursor
# https://www.powerdns.com/recursor.html

mkImage {
  drv = pkgs.pdns-recursor;
  name = "pdns-recursor";
  tag = "v${pkgs.pdns-recursor.version}";
  entrypoint = [ "${pkgs.pdns-recursor}/bin/pdns_recursor" ];
  # Was `--help` (a one-shot). Run the recursor in the foreground (default):
  # bind all interfaces on a non-privileged port (the default :53 can't be
  # bound by mkImage's nonroot user) and keep the control socket + pid under
  # the writable /tmp. The recursor ships built-in root hints, so it resolves
  # out of the box with no config file. Operators mount their own recursor.yml
  # and run on :53 with the right capabilities.
  cmd = [
    "--local-address=0.0.0.0"
    "--local-port=5353"
    "--socket-dir=/tmp"
  ];

  labels = {
    "org.opencontainers.image.title" = "PowerDNS Recursor";
    "org.opencontainers.image.description" = "High-performance DNS recursor";
    "org.opencontainers.image.version" = pkgs.pdns-recursor.version;
  };
}
