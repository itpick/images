{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# haproxy-fips
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
  name = "haproxy-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "haproxy-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "haproxy-fips";
      "org.opencontainers.image.description" = "haproxy-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
