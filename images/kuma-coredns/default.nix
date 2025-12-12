{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kuma-coredns
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
  name = "kuma-coredns";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kuma-coredns-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kuma coredns";
      "org.opencontainers.image.description" = "kuma-coredns container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
