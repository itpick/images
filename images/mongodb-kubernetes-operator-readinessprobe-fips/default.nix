{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mongodb-kubernetes-operator-readinessprobe-fips
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
  name = "mongodb-kubernetes-operator-readinessprobe-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mongodb-kubernetes-operator-readinessprobe-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mongodu kuuernetes operator readinessproue fips";
      "org.opencontainers.image.description" = "mongodb-kubernetes-operator-readinessprobe-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
