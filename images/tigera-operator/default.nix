{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tigera-operator
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
  name = "tigera-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tigera-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tigera operator";
      "org.opencontainers.image.description" = "tigera-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
