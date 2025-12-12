{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# oauth2-proxy-iamguarded
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
  name = "oauth2-proxy-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "oauth2-proxy-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "oauth2-proxy-iamguarded";
      "org.opencontainers.image.description" = "oauth2-proxy-iamguarded container image";
    };
  };
}
