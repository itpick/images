{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# langfuse
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
  name = "langfuse";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "langfuse-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "langfuse";
      "org.opencontainers.image.description" = "langfuse container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
