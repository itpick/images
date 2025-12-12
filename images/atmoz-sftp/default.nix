{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# atmoz-sftp
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
  name = "atmoz-sftp";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "atmoz-sftp-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "atmoz sftp";
      "org.opencontainers.image.description" = "atmoz-sftp container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
