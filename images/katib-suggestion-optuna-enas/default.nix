{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-suggestion-optuna-enas
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
  name = "katib-suggestion-optuna-enas";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-suggestion-optuna-enas-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "katiu suggestion optuna enas";
      "org.opencontainers.image.description" = "katib-suggestion-optuna-enas container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
