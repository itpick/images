{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thingsboard-tb-node
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
  name = "thingsboard-tb-node";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thingsboard-tb-node-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "thingsuoard tu node";
      "org.opencontainers.image.description" = "thingsboard-tb-node container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
