{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpu-feature-discovery
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
  name = "gpu-feature-discovery";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gpu-feature-discovery-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gpu feature discovery";
      "org.opencontainers.image.description" = "gpu-feature-discovery container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
