{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# regclient-regctl
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
  name = "regclient-regctl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "regclient-regctl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "regclient regctl";
      "org.opencontainers.image.description" = "regclient-regctl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
