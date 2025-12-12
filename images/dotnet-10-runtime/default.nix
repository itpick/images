{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-10-runtime
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
  name = "dotnet-10-runtime";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dotnet-10-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dotnet 10 runtime";
      "org.opencontainers.image.description" = "dotnet-10-runtime container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
