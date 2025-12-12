{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# chainguard-security-guide
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
  name = "chainguard-security-guide";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "chainguard-security-guide-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "chainguard security guide";
      "org.opencontainers.image.description" = "chainguard-security-guide container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
