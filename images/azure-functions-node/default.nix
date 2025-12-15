{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-node
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "azure-functions-node";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-node-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "azure-functions-node";
      "org.opencontainers.image.description" = "azure-functions-node container image";
    };
  };
}
