{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# doppler-kubernetes-operator
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
  name = "doppler-kubernetes-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "doppler-kubernetes-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "doppler kuuernetes operator";
      "org.opencontainers.image.description" = "doppler-kubernetes-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
