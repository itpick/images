{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sealed-secrets-controller
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
  name = "sealed-secrets-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "sealed-secrets-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sealed-secrets-controller";
      "org.opencontainers.image.description" = "sealed-secrets-controller container image";
    };
  };
}
