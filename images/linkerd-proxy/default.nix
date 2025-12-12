{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-proxy
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
  name = "linkerd-proxy";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-proxy";
      "org.opencontainers.image.description" = "linkerd-proxy container image";
    };
  };
}
