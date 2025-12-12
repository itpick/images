{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# adoptium-jre-fips
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
  name = "adoptium-jre-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "adoptium-jre-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "adoptium-jre-fips";
      "org.opencontainers.image.description" = "adoptium-jre-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
