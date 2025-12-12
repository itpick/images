{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# graalvm-25-ce-default-jdk
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
  name = "graalvm-25-ce-default-jdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "graalvm-25-ce-default-jdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "graalvm 25 ce default jdk";
      "org.opencontainers.image.description" = "graalvm-25-ce-default-jdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
