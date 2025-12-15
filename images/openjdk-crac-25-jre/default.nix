{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-crac-25-jre
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
  name = "openjdk-crac-25-jre";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-crac-25-jre-root";
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
      "org.opencontainers.image.title" = "openjdk crac 25 jre";
      "org.opencontainers.image.description" = "OpenJDK 25 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
