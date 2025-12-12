{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dynamic-localpv-provisioner-fips
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
  name = "dynamic-localpv-provisioner-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dynamic-localpv-provisioner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dynamic localpv provisioner fips";
      "org.opencontainers.image.description" = "dynamic-localpv-provisioner-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
