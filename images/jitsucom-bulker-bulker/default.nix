{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-bulker-bulker
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
  name = "jitsucom-bulker-bulker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-bulker-bulker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom uulker uulker";
      "org.opencontainers.image.description" = "jitsucom-bulker-bulker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
