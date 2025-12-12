{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# volsync-fips-diskrsync-tcp
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
  name = "volsync-fips-diskrsync-tcp";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "volsync-fips-diskrsync-tcp-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "volsync fips diskrsync tcp";
      "org.opencontainers.image.description" = "volsync-fips-diskrsync-tcp container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
