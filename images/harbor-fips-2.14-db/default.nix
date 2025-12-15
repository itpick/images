{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-fips-2.14-db
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
  name = "harbor-fips-2.14-db";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "harbor-fips-2.14-db-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "haruor fips 2.14 db";
      "org.opencontainers.image.description" = "harbor-fips-2.14-db container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
