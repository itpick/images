{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  gradlePackages = with pkgs; [
    gradle
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
  name = "gradle";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gradle-root";
      paths = base.basePackages ++ gradlePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath gradlePackages}"
      "JAVA_HOME=${pkgs.openjdk21}"
      "GRADLE_USER_HOME=/home/nonroot/.gradle"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Gradle build automation tool";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.gradle.version;
      "io.nix-containers.image.upstream" = "https://gradle.org/";
      "io.nix-containers.image.category" = "build-env";
      "io.nix-containers.image.aliases" = "gradle,java-build,build-tool";
    };
  };
}