{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  jdkPackages = with pkgs; [
    openjdk21
    git
    bash
    coreutils
    findutils
    which
    gnumake
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "jdk";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "jdk-root";
      paths = base.basePackages ++ jdkPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jdkPackages}"
      "JAVA_HOME=${pkgs.openjdk21}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "OpenJDK Java Development Kit";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.openjdk.version;
      "io.nix-containers.image.upstream" = "https://openjdk.java.net/";
      "io.nix-containers.image.category" = "build-env";
      "io.nix-containers.image.aliases" = "jdk,java,openjdk";
    };
  };
}