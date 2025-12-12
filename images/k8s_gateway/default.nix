{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s_gateway
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
  name = "k8s_gateway";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8s_gateway-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8s_gateway";
      "org.opencontainers.image.description" = "k8s_gateway container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
