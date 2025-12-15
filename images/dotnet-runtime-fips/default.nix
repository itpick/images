{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dotnet-runtime-fips
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
  name = "dotnet-runtime-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dotnet-runtime-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "dotnet-runtime-fips";
      "org.opencontainers.image.description" = "dotnet-runtime-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
