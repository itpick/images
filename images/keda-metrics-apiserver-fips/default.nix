{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keda-metrics-apiserver-fips
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
  name = "keda-metrics-apiserver-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keda-metrics-apiserver-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keda-metrics-apiserver-fips";
      "org.opencontainers.image.description" = "keda-metrics-apiserver-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
