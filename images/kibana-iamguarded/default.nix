{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kibana-iamguarded
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
  name = "kibana-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kibana-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kibana-iamguarded";
      "org.opencontainers.image.description" = "kibana-iamguarded container image";
    };
  };
}
