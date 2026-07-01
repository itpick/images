{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# envoy-nixchart-fips
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
  name = "envoy-nixchart-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "envoy-nixchart-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "envoy-nixchart-fips";
      "org.opencontainers.image.description" = "envoy-nixchart-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
