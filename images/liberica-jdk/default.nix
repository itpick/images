{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# liberica-jdk
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "liberica-jdk";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "liberica-jdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "liberica-jdk";
      "org.opencontainers.image.description" = "liberica-jdk container image";
    };
  };
}
