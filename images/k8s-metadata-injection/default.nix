{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-metadata-injection
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
  name = "k8s-metadata-injection";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k8s-metadata-injection-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8s-metadata-injection";
      "org.opencontainers.image.description" = "k8s-metadata-injection container image";
    };
  };
}
