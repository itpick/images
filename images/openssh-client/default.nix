{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssh-client
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
  name = "openssh-client";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssh-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openssh client";
      "org.opencontainers.image.description" = "openssh-client container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
