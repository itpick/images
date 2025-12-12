{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keda-admission-webhooks-fips
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
  name = "keda-admission-webhooks-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "keda-admission-webhooks-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keda-admission-webhooks-fips";
      "org.opencontainers.image.description" = "keda-admission-webhooks-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
