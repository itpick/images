{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-modelmesh
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
  name = "kserve-modelmesh";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kserve-modelmesh-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kserve modelmesh";
      "org.opencontainers.image.description" = "kserve-modelmesh container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
