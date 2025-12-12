{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-25-default-jdk
# OpenJDK Java runtime

let
  jdk = pkgs.jdk25;

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
  name = "openjdk-25-default-jdk";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-25-default-jdk-root";
      paths = base.basePackages ++ jdkPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPkgs}"
      "JAVA_HOME=${jdk}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openjdk 25 default jdk";
      "org.opencontainers.image.description" = "OpenJDK 25 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
