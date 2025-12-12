{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# metacontroller
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
  name = "metacontroller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "metacontroller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "metacontroller";
      "org.opencontainers.image.description" = "metacontroller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
