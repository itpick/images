{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# objectstorage-sidecar-fips
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
  name = "objectstorage-sidecar-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "objectstorage-sidecar-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "objectstorage-sidecar-fips";
      "org.opencontainers.image.description" = "objectstorage-sidecar-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
