{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spark-3.5-scala
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
  name = "spark-3.5-scala";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "spark-3.5-scala-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spark 3.5 scala";
      "org.opencontainers.image.description" = "spark-3.5-scala container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
