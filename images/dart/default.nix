{ mkImage, pkgs, lib, ... }:

# Dart - Programming language
# https://dart.dev/

mkImage {
  drv = pkgs.dart;
  name = "dart";
  tag = "v${pkgs.dart.version}";
  entrypoint = [ "${pkgs.dart}/bin/dart" ];
  cmd = [ "--version" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Dart";
    "org.opencontainers.image.description" = "Dart programming language SDK";
    "org.opencontainers.image.version" = pkgs.dart.version;
  };
}
