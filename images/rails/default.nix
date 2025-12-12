{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rails
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
  name = "rails";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "rails-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rails";
      "org.opencontainers.image.description" = "rails container image";
    };
  };
}
