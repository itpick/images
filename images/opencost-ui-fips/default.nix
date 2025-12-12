{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opencost-ui-fips
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
  name = "opencost-ui-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "opencost-ui-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opencost-ui-fips";
      "org.opencontainers.image.description" = "opencost-ui-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
