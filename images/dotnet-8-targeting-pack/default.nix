{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-8-targeting-pack
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
  name = "dotnet-8-targeting-pack";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dotnet-8-targeting-pack-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dotnet 8 targeting pack";
      "org.opencontainers.image.description" = "dotnet-8-targeting-pack container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
