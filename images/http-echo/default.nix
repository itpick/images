{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# http-echo
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
  name = "http-echo";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "http-echo-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "http echo";
      "org.opencontainers.image.description" = "http-echo container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
