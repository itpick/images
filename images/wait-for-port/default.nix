{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wait-for-port
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
  name = "wait-for-port";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wait-for-port-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "wait for port";
      "org.opencontainers.image.description" = "wait-for-port container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
