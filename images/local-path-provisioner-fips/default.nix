{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# local-path-provisioner-fips
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
  name = "local-path-provisioner-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "local-path-provisioner-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "local path provisioner fips";
      "org.opencontainers.image.description" = "local-path-provisioner-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
