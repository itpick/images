{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# crictl
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
  name = "crictl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "crictl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "crictl";
      "org.opencontainers.image.description" = "crictl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
