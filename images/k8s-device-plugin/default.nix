{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-device-plugin
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
  name = "k8s-device-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8s-device-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8s device plugin";
      "org.opencontainers.image.description" = "k8s-device-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
