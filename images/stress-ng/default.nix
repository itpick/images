{ mkImage, pkgs, lib, ... }:

# stress-ng - System stress testing
# https://github.com/ColinIanKing/stress-ng

mkImage {
  drv = pkgs.stress-ng;
  name = "stress-ng";
  tag = "v${pkgs.stress-ng.version}";
  entrypoint = [ "${pkgs.stress-ng}/bin/stress-ng" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "stress-ng";
    "org.opencontainers.image.description" = "Stress test tool for various system resources";
    "org.opencontainers.image.version" = pkgs.stress-ng.version;
  };
}
