{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kibana-9.2-iamguarded
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
  name = "kibana-9.2-iamguarded";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kibana-9.2-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kiuana 9.2 iamguarded";
      "org.opencontainers.image.description" = "kibana-9.2-iamguarded container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
