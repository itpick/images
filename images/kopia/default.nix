{ mkImage, pkgs, lib, ... }:

# Kopia - Backup tool
# https://kopia.io/

mkImage {
  drv = pkgs.kopia;
  name = "kopia";
  tag = "v${pkgs.kopia.version}";
  entrypoint = [ "${pkgs.kopia}/bin/kopia" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kopia";
    "org.opencontainers.image.description" = "Fast and secure open-source backup tool";
    "org.opencontainers.image.version" = pkgs.kopia.version;
  };
}
