{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ingress-nginx-custom-error-pages-iamguarded
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
  name = "ingress-nginx-custom-error-pages-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ingress-nginx-custom-error-pages-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ingress-nginx-custom-error-pages-iamguarded";
      "org.opencontainers.image.description" = "ingress-nginx-custom-error-pages-iamguarded container image";
    };
  };
}
