{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openjdk-bcfips-policy-140-3-j17
# OpenJDK Java runtime

let
  jdk = pkgs.jdk140;

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
  name = "openjdk-bcfips-policy-140-3-j17";
  tag = jdk.version;

  copyToRoot = [
    (buildEnv {
      name = "openjdk-bcfips-policy-140-3-j17-root";
      paths = base.basePackages ++ jdkPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPkgs}"
      "JAVA_HOME=${jdk}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openjdk ucfips policy 140 3 j17";
      "org.opencontainers.image.description" = "OpenJDK 140 Java runtime";
      "org.opencontainers.image.version" = jdk.version;
    };
  };
}
