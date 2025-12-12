{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-11-jre
# OpenJDK Java runtime

let
  jdk = pkgs.jdk11;

  jdkPkgs = [
    jdk
    pkgs.bash
    pkgs.coreutils
    pkgs.cacert
    pkgs.tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "openjdk-11-jre";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-11-jre-root";
      paths = base.basePackages ++ jdkPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPkgs}"
      "JAVA_HOME=${jdk}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openjdk 11 jre";
      "org.opencontainers.image.description" = "OpenJDK 11 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
