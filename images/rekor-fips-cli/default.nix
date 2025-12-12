{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rekor-fips-cli
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
  name = "rekor-fips-cli";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rekor-fips-cli-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rekor fips cli";
      "org.opencontainers.image.description" = "rekor-fips-cli container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
