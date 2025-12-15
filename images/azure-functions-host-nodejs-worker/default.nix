{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-host-nodejs-worker
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
  name = "azure-functions-host-nodejs-worker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-host-nodejs-worker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "azure functions host nodejs worker";
      "org.opencontainers.image.description" = "azure-functions-host-nodejs-worker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
