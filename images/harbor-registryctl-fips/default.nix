{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-registryctl-fips
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
  name = "harbor-registryctl-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "harbor-registryctl-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "harbor-registryctl-fips";
      "org.opencontainers.image.description" = "harbor-registryctl-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
