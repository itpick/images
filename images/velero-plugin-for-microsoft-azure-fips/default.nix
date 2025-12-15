{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-plugin-for-microsoft-azure-fips
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
  name = "velero-plugin-for-microsoft-azure-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-plugin-for-microsoft-azure-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "velero plugin for microsoft azure fips";
      "org.opencontainers.image.description" = "velero-plugin-for-microsoft-azure-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
