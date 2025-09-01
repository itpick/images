{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  phpPackages = with pkgs; [
    php83
    php83Packages.composer
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "php";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "php-root";
      paths = base.basePackages ++ phpPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath phpPackages}"
      "COMPOSER_HOME=/home/nonroot/.composer"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "PHP programming language";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.php.version;
      "io.nix-containers.image.upstream" = "https://www.php.net/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "php,scripting,web-dev";
    };
  };
}