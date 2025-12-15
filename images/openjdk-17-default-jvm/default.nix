{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-17-default-jvm
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
  name = "openjdk-17-default-jvm";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-17-default-jvm-root";
      paths = base.basePackages ++ jdkPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPkgs}"
      "JAVA_HOME=${jdk}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "openjdk 17 default jvm";
      "org.opencontainers.image.description" = "OpenJDK 17 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
