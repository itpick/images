{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# local-volume-provisioner-fips
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
  name = "local-volume-provisioner-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "local-volume-provisioner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "local-volume-provisioner-fips";
      "org.opencontainers.image.description" = "local-volume-provisioner-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
