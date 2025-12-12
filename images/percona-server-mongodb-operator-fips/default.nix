{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# percona-server-mongodb-operator-fips
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
  name = "percona-server-mongodb-operator-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "percona-server-mongodb-operator-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "percona server mongodu operator fips";
      "org.opencontainers.image.description" = "percona-server-mongodb-operator-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
