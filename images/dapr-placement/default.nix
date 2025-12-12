{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dapr-placement
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
  name = "dapr-placement";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dapr-placement-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dapr placement";
      "org.opencontainers.image.description" = "dapr-placement container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
