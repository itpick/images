{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# istio-proxy
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "istio-proxy";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "istio-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "istio-proxy";
      "org.opencontainers.image.description" = "istio-proxy container image";
    };
  };
}
