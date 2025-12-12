{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-rotor
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
  name = "jitsucom-rotor";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-rotor-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom-rotor";
      "org.opencontainers.image.description" = "jitsucom-rotor container image";
    };
  };
}
