{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  jrePackages = with pkgs; [
    openjdk21_headless
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "jre";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "jre-root";
      paths = base.basePackages ++ jrePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath jrePackages}"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "OpenJDK Java Runtime Environment";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.openjdk.version;
      "io.nix-containers.image.upstream" = "https://openjdk.java.net/";
      "io.nix-containers.image.category" = "runtime";
      "io.nix-containers.image.aliases" = "jre,java,openjdk";
    };
  };
}