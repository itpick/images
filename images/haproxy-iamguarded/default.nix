{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# haproxy-iamguarded
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
  name = "haproxy-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "haproxy-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "haproxy-iamguarded";
      "org.opencontainers.image.description" = "haproxy-iamguarded container image";
    };
  };
}
