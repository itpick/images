{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keda-fips-2.18-admission-webhooks
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
  name = "keda-fips-2.18-admission-webhooks";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "keda-fips-2.18-admission-webhooks-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "keda fips 2.18 admission weuhooks";
      "org.opencontainers.image.description" = "keda-fips-2.18-admission-webhooks container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
