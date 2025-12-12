{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redpanda
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
  name = "redpanda";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "redpanda-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redpanda";
      "org.opencontainers.image.description" = "redpanda container image";
    };
  };
}
