{ mkImage, pkgs, lib, ... }:

# Laravel - PHP web application framework CLI
# https://laravel.com/

mkImage {
  drv = pkgs.laravel;
  name = "laravel";
  tag = "v${pkgs.laravel.version}";
  entrypoint = [ "${pkgs.laravel}/bin/laravel" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Laravel";
    "org.opencontainers.image.description" = "PHP web application framework CLI";
    "org.opencontainers.image.version" = pkgs.laravel.version;
  };
}
