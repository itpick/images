{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# text-generation-inference
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
  name = "text-generation-inference";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "text-generation-inference-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "text-generation-inference";
      "org.opencontainers.image.description" = "text-generation-inference container image";
    };
  };
}
