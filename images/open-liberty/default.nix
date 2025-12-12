{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# open-liberty
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
  name = "open-liberty";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "open-liberty-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "open-liberty";
      "org.opencontainers.image.description" = "open-liberty container image";
    };
  };
}
