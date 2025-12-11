{ mkImage, pkgs, lib, ... }:

# Perl - Programming language
# https://www.perl.org/

mkImage {
  drv = pkgs.perl;
  name = "perl";
  tag = "v${pkgs.perl.version}";
  entrypoint = [ "${pkgs.perl}/bin/perl" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "Perl";
    "org.opencontainers.image.description" = "Perl programming language";
    "org.opencontainers.image.version" = pkgs.perl.version;
  };
}
