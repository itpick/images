{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitsucom-jitsu-rotor
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
  name = "jitsucom-jitsu-rotor";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitsucom-jitsu-rotor-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jitsucom jitsu rotor";
      "org.opencontainers.image.description" = "jitsucom-jitsu-rotor container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
