{ mkImage, pkgs, lib, ... }:

# litecli - SQLite CLI with auto-completion
# https://litecli.com/

mkImage {
  drv = pkgs.litecli;
  name = "litecli";
  tag = "v${pkgs.litecli.version}";
  entrypoint = [ "${pkgs.litecli}/bin/litecli" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "litecli";
    "org.opencontainers.image.description" = "CLI for SQLite with auto-completion and syntax highlighting";
    "org.opencontainers.image.version" = pkgs.litecli.version;
  };
}
