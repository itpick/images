{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-cni-plugin
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
  name = "linkerd2-cni-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-cni-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd2 cni plugin";
      "org.opencontainers.image.description" = "linkerd2-cni-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
