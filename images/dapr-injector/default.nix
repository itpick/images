{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-injector
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
  name = "dapr-injector";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-injector-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dapr injector";
      "org.opencontainers.image.description" = "dapr-injector container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
