{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# haproxy-ingress
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
  name = "haproxy-ingress";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "haproxy-ingress-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "haproxy ingress";
      "org.opencontainers.image.description" = "haproxy-ingress container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
