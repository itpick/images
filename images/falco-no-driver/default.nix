{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco-no-driver
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
  name = "falco-no-driver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "falco-no-driver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "falco no driver";
      "org.opencontainers.image.description" = "falco-no-driver container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
