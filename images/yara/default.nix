{ mkImage, pkgs, lib, ... }:

# YARA - Pattern matching tool for malware research
# https://virustotal.github.io/yara/

mkImage {
  drv = pkgs.yara;
  name = "yara";
  tag = "v${pkgs.yara.version}";
  entrypoint = [ "${pkgs.yara}/bin/yara" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "YARA";
    "org.opencontainers.image.description" = "Pattern matching swiss knife for malware researchers";
    "org.opencontainers.image.version" = pkgs.yara.version;
  };
}
