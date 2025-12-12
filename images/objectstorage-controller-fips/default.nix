{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# objectstorage-controller-fips
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
  name = "objectstorage-controller-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "objectstorage-controller-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "objectstorage-controller-fips";
      "org.opencontainers.image.description" = "objectstorage-controller-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
