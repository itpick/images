{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-controller
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
  name = "linkerd-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-controller";
      "org.opencontainers.image.description" = "linkerd-controller container image";
    };
  };
}
