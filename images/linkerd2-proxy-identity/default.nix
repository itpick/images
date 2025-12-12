{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd2-proxy-identity
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "linkerd2-proxy-identity";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd2-proxy-identity-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "linkerd2 proxy identity";
      "org.opencontainers.image.description" = "linkerd2-proxy-identity container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
