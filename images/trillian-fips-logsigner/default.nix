{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trillian-fips-logsigner
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
  name = "trillian-fips-logsigner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trillian-fips-logsigner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trillian fips logsigner";
      "org.opencontainers.image.description" = "trillian-fips-logsigner container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
