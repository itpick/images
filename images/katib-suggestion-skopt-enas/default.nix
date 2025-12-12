{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-suggestion-skopt-enas
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
  name = "katib-suggestion-skopt-enas";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-suggestion-skopt-enas-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "katiu suggestion skopt enas";
      "org.opencontainers.image.description" = "katib-suggestion-skopt-enas container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
