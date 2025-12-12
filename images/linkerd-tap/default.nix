{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-tap
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
  name = "linkerd-tap";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "linkerd-tap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd-tap";
      "org.opencontainers.image.description" = "linkerd-tap container image";
    };
  };
}
