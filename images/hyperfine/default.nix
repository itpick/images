{ mkImage, pkgs, lib, ... }:

# hyperfine - Command-line benchmarking tool
# https://github.com/sharkdp/hyperfine

mkImage {
  drv = pkgs.hyperfine;
  name = "hyperfine";
  tag = "v${pkgs.hyperfine.version}";
  entrypoint = [ "${pkgs.hyperfine}/bin/hyperfine" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "hyperfine";
    "org.opencontainers.image.description" = "Command-line benchmarking tool";
    "org.opencontainers.image.version" = pkgs.hyperfine.version;
  };
}
