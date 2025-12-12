{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k3s-openssl-static
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
  name = "k3s-openssl-static";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k3s-openssl-static-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k3s-openssl-static";
      "org.opencontainers.image.description" = "k3s-openssl-static container image";
    };
  };
}
