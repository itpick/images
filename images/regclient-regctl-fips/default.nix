{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# regclient-regctl-fips
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
  name = "regclient-regctl-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "regclient-regctl-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "regclient regctl fips";
      "org.opencontainers.image.description" = "regclient-regctl-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
