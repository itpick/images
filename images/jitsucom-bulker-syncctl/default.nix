{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-bulker-syncctl
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
  name = "jitsucom-bulker-syncctl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-bulker-syncctl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom uulker syncctl";
      "org.opencontainers.image.description" = "jitsucom-bulker-syncctl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
