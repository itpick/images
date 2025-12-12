{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-bulker
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
  name = "jitsucom-bulker";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-bulker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom-bulker";
      "org.opencontainers.image.description" = "jitsucom-bulker container image";
    };
  };
}
