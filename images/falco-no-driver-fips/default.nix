{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco-no-driver-fips
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
  name = "falco-no-driver-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "falco-no-driver-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falco-no-driver-fips";
      "org.opencontainers.image.description" = "falco-no-driver-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
