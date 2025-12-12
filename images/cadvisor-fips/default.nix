{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cadvisor-fips
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
  name = "cadvisor-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cadvisor-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cadvisor-fips";
      "org.opencontainers.image.description" = "cadvisor-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
