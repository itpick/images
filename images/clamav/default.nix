# clamav
# =============
# ClamAV - Open source antivirus engine
# https://www.clamav.net/
#
# ClamAV is an open source antivirus engine for detecting trojans,
# viruses, malware and other malicious threats.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.clamav;
  name = "clamav";
  tag = "v${pkgs.clamav.version}";
  entrypoint = [ "${pkgs.clamav}/bin/clamd" ];
  cmd = [];

  extraPkgs = with pkgs; [
    bash
    coreutils
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "ClamAV";
    "org.opencontainers.image.description" = "Open source antivirus engine";
    "org.opencontainers.image.version" = pkgs.clamav.version;
  };
}
