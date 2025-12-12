{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# perl-fips
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
  name = "perl-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "perl-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "perl-fips";
      "org.opencontainers.image.description" = "perl-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
