{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# chainguard-source
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
  name = "chainguard-source";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "chainguard-source-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "chainguard source";
      "org.opencontainers.image.description" = "chainguard-source container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
