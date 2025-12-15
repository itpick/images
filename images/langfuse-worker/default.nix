{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# langfuse-worker
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
  name = "langfuse-worker";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "langfuse-worker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "langfuse-worker";
      "org.opencontainers.image.description" = "langfuse-worker container image";
    };
  };
}
