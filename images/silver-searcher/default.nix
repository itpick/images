{ mkImage, pkgs, lib, ... }:

# The Silver Searcher - Code search tool
# https://github.com/ggreer/the_silver_searcher

mkImage {
  drv = pkgs.silver-searcher;
  name = "silver-searcher";
  tag = "v${pkgs.silver-searcher.version}";
  entrypoint = [ "${pkgs.silver-searcher}/bin/ag" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "The Silver Searcher";
    "org.opencontainers.image.description" = "Code-searching tool similar to ack";
    "org.opencontainers.image.version" = pkgs.silver-searcher.version;
  };
}
