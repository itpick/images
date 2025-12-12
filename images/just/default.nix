{ mkImage, pkgs, lib, ... }:

# just - Command runner
# https://github.com/casey/just

mkImage {
  drv = pkgs.just;
  name = "just";
  tag = "v${pkgs.just.version}";
  entrypoint = [ "${pkgs.just}/bin/just" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "just";
    "org.opencontainers.image.description" = "Handy way to save and run project-specific commands";
    "org.opencontainers.image.version" = pkgs.just.version;
  };
}
