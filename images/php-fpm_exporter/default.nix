{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# php-fpm_exporter - Prometheus exporter for PHP-FPM
# https://github.com/hipages/php-fpm_exporter

let
  imagePkgs = with pkgs; [
    prometheus-php-fpm-exporter
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "php-fpm_exporter";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.prometheus-php-fpm-exporter.version;
  copyToRoot = [
    (buildEnv {
      name = "php-fpm_exporter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # The stub had no Cmd. Run the metrics server in the foreground; it binds
    # :9253 (>1024, nonroot-bindable) and only contacts php-fpm on a scrape, so
    # it starts and stays up standalone (no target needed for the kind probe to
    # see a Running pod). Point it at a php-fpm via PHP_FPM_SCRAPE_URI / args.
    Cmd = [ "php-fpm_exporter" "server" ];
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath imagePkgs}"
    ];
    ExposedPorts = {
      "9253/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "php-fpm_exporter";
      "org.opencontainers.image.description" = "Prometheus exporter for PHP-FPM";
      "org.opencontainers.image.version" = pkgs.prometheus-php-fpm-exporter.version;
      "io.nix-containers.image.upstream" = "https://github.com/hipages/php-fpm_exporter";
      "io.nix-containers.image.category" = "monitoring";
      "io.nix-containers.image.aliases" = "php-fpm_exporter,php-fpm-exporter,exporter";
    };
  };
}
