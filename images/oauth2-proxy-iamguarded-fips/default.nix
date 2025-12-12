{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# oauth2-proxy-iamguarded-fips
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
  name = "oauth2-proxy-iamguarded-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "oauth2-proxy-iamguarded-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "oauth2-proxy-iamguarded-fips";
      "org.opencontainers.image.description" = "oauth2-proxy-iamguarded-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
