{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redisinsight
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
  name = "redisinsight";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "redisinsight-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redisinsight";
      "org.opencontainers.image.description" = "redisinsight container image";
    };
  };
}
