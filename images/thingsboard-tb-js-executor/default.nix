{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thingsboard-tb-js-executor
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
  name = "thingsboard-tb-js-executor";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thingsboard-tb-js-executor-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "thingsuoard tu js executor";
      "org.opencontainers.image.description" = "thingsboard-tb-js-executor container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
