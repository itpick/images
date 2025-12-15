{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# helm-mapkubeapis
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
  name = "helm-mapkubeapis";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "helm-mapkubeapis-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "helm mapkuueapis";
      "org.opencontainers.image.description" = "helm-mapkubeapis container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
