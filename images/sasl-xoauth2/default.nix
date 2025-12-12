{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sasl-xoauth2
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
  name = "sasl-xoauth2";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sasl-xoauth2-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sasl xoauth2";
      "org.opencontainers.image.description" = "sasl-xoauth2 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
