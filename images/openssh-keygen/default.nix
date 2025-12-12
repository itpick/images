{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssh-keygen
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
  name = "openssh-keygen";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssh-keygen-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openssh keygen";
      "org.opencontainers.image.description" = "openssh-keygen container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
