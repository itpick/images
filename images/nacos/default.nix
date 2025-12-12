{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nacos
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
  name = "nacos";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "nacos-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nacos";
      "org.opencontainers.image.description" = "nacos container image";
    };
  };
}
