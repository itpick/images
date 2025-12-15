{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nfs-subdir-external-provisioner-fips
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
  name = "nfs-subdir-external-provisioner-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nfs-subdir-external-provisioner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nfs suudir external provisioner fips";
      "org.opencontainers.image.description" = "nfs-subdir-external-provisioner-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
