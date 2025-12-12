{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpu-feature-discovery-fips
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
  name = "gpu-feature-discovery-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gpu-feature-discovery-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gpu feature discovery fips";
      "org.opencontainers.image.description" = "gpu-feature-discovery-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
