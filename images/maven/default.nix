{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  mavenPackages = with pkgs; [
    maven
    openjdk21
    git
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "maven";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "maven-root";
      paths = base.basePackages ++ mavenPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mavenPackages}"
      "JAVA_HOME=${pkgs.openjdk21}"
      "MAVEN_CONFIG=/home/nonroot/.m2"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Apache Maven build automation tool";
    };
  };
}