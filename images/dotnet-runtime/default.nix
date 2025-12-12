{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-runtime
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
  name = "dotnet-runtime";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dotnet-runtime-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dotnet-runtime";
      "org.opencontainers.image.description" = "dotnet-runtime container image";
    };
  };
}
