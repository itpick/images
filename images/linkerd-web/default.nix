{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-web
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
  name = "linkerd-web";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-web-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-web";
      "org.opencontainers.image.description" = "linkerd-web container image";
    };
  };
}
