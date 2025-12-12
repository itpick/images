{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-scanner-trivy-fips
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
  name = "harbor-scanner-trivy-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "harbor-scanner-trivy-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "haruor scanner trivy fips";
      "org.opencontainers.image.description" = "harbor-scanner-trivy-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
