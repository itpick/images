{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# secrets-store-csi-driver-provider-aws-fips
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
  name = "secrets-store-csi-driver-provider-aws-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "secrets-store-csi-driver-provider-aws-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "secrets store csi driver provider aws fips";
      "org.opencontainers.image.description" = "secrets-store-csi-driver-provider-aws-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
