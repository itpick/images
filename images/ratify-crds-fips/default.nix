{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ratify-crds-fips
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
  name = "ratify-crds-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "ratify-crds-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ratify-crds-fips";
      "org.opencontainers.image.description" = "ratify-crds-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
