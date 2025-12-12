{ mkImage, pkgs, lib, ... }:

# SABnzbd - Usenet downloader
# https://sabnzbd.org/

mkImage {
  drv = pkgs.sabnzbd;
  name = "sabnzbd";
  tag = "v${pkgs.sabnzbd.version}";
  entrypoint = [ "${pkgs.sabnzbd}/bin/sabnzbd" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "SABnzbd";
    "org.opencontainers.image.description" = "Usenet downloader";
    "org.opencontainers.image.version" = pkgs.sabnzbd.version;
  };
}
