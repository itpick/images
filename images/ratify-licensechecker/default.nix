{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-licensechecker
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "ratify-licensechecker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ratify-licensechecker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ratify licensechecker";
      "org.opencontainers.image.description" = "ratify-licensechecker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
