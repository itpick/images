{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-9-runtime
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
  name = "dotnet-9-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dotnet-9-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "dotnet 9 runtime";
      "org.opencontainers.image.description" = "dotnet-9-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
