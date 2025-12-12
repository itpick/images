{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# p11-kit-trust
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
  name = "p11-kit-trust";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "p11-kit-trust-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "p11 kit trust";
      "org.opencontainers.image.description" = "p11-kit-trust container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
