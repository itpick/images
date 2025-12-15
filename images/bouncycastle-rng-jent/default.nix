{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bouncycastle-rng-jent
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
  name = "bouncycastle-rng-jent";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bouncycastle-rng-jent-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uouncycastle rng jent";
      "org.opencontainers.image.description" = "bouncycastle-rng-jent container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
