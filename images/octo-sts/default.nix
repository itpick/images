{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# octo-sts
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
  name = "octo-sts";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "octo-sts-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "octo sts";
      "org.opencontainers.image.description" = "octo-sts container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
