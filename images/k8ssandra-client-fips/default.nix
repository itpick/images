{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8ssandra-client-fips
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
  name = "k8ssandra-client-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8ssandra-client-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8ssandra client fips";
      "org.opencontainers.image.description" = "k8ssandra-client-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
