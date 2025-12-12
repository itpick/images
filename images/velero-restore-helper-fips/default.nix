{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-restore-helper-fips
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
  name = "velero-restore-helper-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-restore-helper-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "velero restore helper fips";
      "org.opencontainers.image.description" = "velero-restore-helper-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
