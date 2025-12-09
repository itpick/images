{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.yq-go;
  name = "yq";
  tag = "v${pkgs.yq-go.version}";
  entrypoint = [ "${pkgs.yq-go}/bin/yq" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "yq";
    "org.opencontainers.image.description" = "Portable command-line YAML/JSON/XML processor";
    "org.opencontainers.image.version" = pkgs.yq-go.version;
  };
}
