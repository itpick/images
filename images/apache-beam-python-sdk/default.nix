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
      "org.opencontainers.image.title" = "apache-beam-python-sdk";
      "org.opencontainers.image.description" = "apache-beam-python-sdk container image";
    };
  };
}
