{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gatekeeper-crds-fips
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
  name = "gatekeeper-crds-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "gatekeeper-crds-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gatekeeper-crds-fips";
      "org.opencontainers.image.description" = "gatekeeper-crds-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
