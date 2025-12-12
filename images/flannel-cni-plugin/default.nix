{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# flannel-cni-plugin
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
  name = "flannel-cni-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "flannel-cni-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "flannel cni plugin";
      "org.opencontainers.image.description" = "flannel-cni-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
