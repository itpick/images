{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssh-sftp-server
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
  name = "openssh-sftp-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssh-sftp-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openssh sftp server";
      "org.opencontainers.image.description" = "openssh-sftp-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
