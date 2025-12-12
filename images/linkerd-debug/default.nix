{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-debug
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
  name = "linkerd-debug";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-debug-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-debug";
      "org.opencontainers.image.description" = "linkerd-debug container image";
    };
  };
}
