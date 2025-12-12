{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k3s-openssl
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
  name = "k3s-openssl";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k3s-openssl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k3s-openssl";
      "org.opencontainers.image.description" = "k3s-openssl container image";
    };
  };
}
