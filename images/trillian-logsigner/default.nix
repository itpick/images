{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trillian-logsigner
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
  name = "trillian-logsigner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trillian-logsigner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trillian logsigner";
      "org.opencontainers.image.description" = "trillian-logsigner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
