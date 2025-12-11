{ mkImage, pkgs, lib, ... }:

# Filebrowser - Web file browser
# https://filebrowser.org/

mkImage {
  drv = pkgs.filebrowser;
  name = "filebrowser";
  tag = "v${pkgs.filebrowser.version}";
  entrypoint = [ "${pkgs.filebrowser}/bin/filebrowser" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Filebrowser";
    "org.opencontainers.image.description" = "Web-based file browser and manager";
    "org.opencontainers.image.version" = pkgs.filebrowser.version;
  };
}
