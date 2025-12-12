{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spamcheck-fips
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
  name = "spamcheck-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "spamcheck-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spamcheck-fips";
      "org.opencontainers.image.description" = "spamcheck-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
