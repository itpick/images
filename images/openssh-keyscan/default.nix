{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssh-keyscan
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
  name = "openssh-keyscan";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssh-keyscan-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openssh keyscan";
      "org.opencontainers.image.description" = "openssh-keyscan container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
