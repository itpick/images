{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-beam-python-sdk
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
  name = "apache-beam-python-sdk";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "apache-beam-python-sdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "apache-beam-python-sdk";
      "org.opencontainers.image.description" = "apache-beam-python-sdk container image";
    };
  };
}
