{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# step-kms-plugin-fips
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "step-kms-plugin-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "step-kms-plugin-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "step kms plugin fips";
      "org.opencontainers.image.description" = "step-kms-plugin-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
