{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pvc-autoresizer-fips
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
  name = "pvc-autoresizer-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pvc-autoresizer-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pvc-autoresizer-fips";
      "org.opencontainers.image.description" = "pvc-autoresizer-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
