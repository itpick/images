{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# containerd-stress
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
  name = "containerd-stress";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "containerd-stress-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "containerd stress";
      "org.opencontainers.image.description" = "containerd-stress container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
