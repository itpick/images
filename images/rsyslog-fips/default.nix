{ mkImage, pkgs, lib, ... }:

# rsyslog-fips
# Container image packaging nixpkgs.rsyslog
mkImage {
  drv = pkgs.rsyslog;
  name = "rsyslog-fips";
  tag = "v${pkgs.rsyslog.version}";
  entrypoint = [ (lib.getExe pkgs.rsyslog) ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rsyslog-fips";
    "org.opencontainers.image.description" = "rsyslog-fips container image (nixpkgs.rsyslog)";
    "org.opencontainers.image.version" = pkgs.rsyslog.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
