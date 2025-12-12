{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openresty-fips
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
  name = "openresty-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "openresty-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openresty-fips";
      "org.opencontainers.image.description" = "openresty-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
