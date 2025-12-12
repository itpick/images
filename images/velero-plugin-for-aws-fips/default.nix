{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# velero-plugin-for-aws-fips
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
  name = "velero-plugin-for-aws-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "velero-plugin-for-aws-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "velero plugin for aws fips";
      "org.opencontainers.image.description" = "velero-plugin-for-aws-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
