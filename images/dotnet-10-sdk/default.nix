{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-10-sdk
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
  name = "dotnet-10-sdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dotnet-10-sdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dotnet 10 sdk";
      "org.opencontainers.image.description" = "dotnet-10-sdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
