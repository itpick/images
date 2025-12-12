{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# longhorn-ui
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
  name = "longhorn-ui";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "longhorn-ui-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "longhorn ui";
      "org.opencontainers.image.description" = "longhorn-ui container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
