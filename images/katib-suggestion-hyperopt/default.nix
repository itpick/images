{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-suggestion-hyperopt
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "katib-suggestion-hyperopt";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-suggestion-hyperopt-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "katiu suggestion hyperopt";
      "org.opencontainers.image.description" = "katib-suggestion-hyperopt container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
