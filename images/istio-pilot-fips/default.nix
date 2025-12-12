{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# istio-pilot-fips
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
  name = "istio-pilot-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "istio-pilot-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "istio-pilot-fips";
      "org.opencontainers.image.description" = "istio-pilot-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
