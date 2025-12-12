{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nodetaint
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
  name = "nodetaint";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nodetaint-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nodetaint";
      "org.opencontainers.image.description" = "nodetaint container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
