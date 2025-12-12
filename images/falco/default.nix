{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco
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
  name = "falco";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "falco-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falco";
      "org.opencontainers.image.description" = "falco container image";
    };
  };
}
