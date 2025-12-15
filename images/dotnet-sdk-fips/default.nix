{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-sdk-fips
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
  name = "dotnet-sdk-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dotnet-sdk-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "dotnet-sdk-fips";
      "org.opencontainers.image.description" = "dotnet-sdk-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
