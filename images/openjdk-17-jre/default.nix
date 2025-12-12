{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-17-jre
# OpenJDK Java runtime

let
  jdk = pkgs.jdk17;

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
  name = "openjdk-17-jre";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-17-jre-root";
      paths = base.basePackages ++ jdkPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPkgs}"
      "JAVA_HOME=${jdk}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openjdk 17 jre";
      "org.opencontainers.image.description" = "OpenJDK 17 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
