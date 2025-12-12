{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# php-fpm_exporter
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "php-fpm_exporter";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "php-fpm_exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "php-fpm_exporter";
      "org.opencontainers.image.description" = "php-fpm_exporter container image";
    };
  };
}
