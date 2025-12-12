{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pdns-recursor-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "pdns-recursor-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "pdns-recursor-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pdns-recursor-fips";
      "org.opencontainers.image.description" = "pdns-recursor-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
