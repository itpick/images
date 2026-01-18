{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-fips-2.14-registryctl
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
  name = "harbor-fips-2.14-registryctl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "harbor-fips-2.14-registryctl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Harbor FIPS 2.14 Registry Controller";
      "org.opencontainers.image.description" = "harbor-fips-2.14-registryctl container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
