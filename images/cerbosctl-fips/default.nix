{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cerbosctl-fips
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
  name = "cerbosctl-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cerbosctl-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cerbosctl-fips";
      "org.opencontainers.image.description" = "cerbosctl-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
