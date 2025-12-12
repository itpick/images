{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-suggestion-nas-darts
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
  name = "katib-suggestion-nas-darts";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-suggestion-nas-darts-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "katiu suggestion nas darts";
      "org.opencontainers.image.description" = "katib-suggestion-nas-darts container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
