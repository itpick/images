{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nist-mip-openssl-provider-fips
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
  name = "nist-mip-openssl-provider-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nist-mip-openssl-provider-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nist mip openssl provider fips";
      "org.opencontainers.image.description" = "nist-mip-openssl-provider-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
