{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-fips-2.14-portal
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
  name = "harbor-fips-2.14-portal";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "harbor-fips-2.14-portal-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "haruor fips 2.14 portal";
      "org.opencontainers.image.description" = "harbor-fips-2.14-portal container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
