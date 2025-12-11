{ mkImage, pkgs, lib, ... }:

# malcontent - Detect malicious behavior in programs
# https://github.com/chainguard-dev/malcontent

mkImage {
  drv = pkgs.malcontent;
  name = "malcontent";
  tag = "v${pkgs.malcontent.version}";
  entrypoint = [ "${pkgs.malcontent}/bin/malcontent-client" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "malcontent";
    "org.opencontainers.image.description" = "Detect malicious behavior in binaries and packages";
    "org.opencontainers.image.version" = pkgs.malcontent.version;
  };
}
