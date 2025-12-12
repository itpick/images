{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# liberica-jdk-fips
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
  name = "liberica-jdk-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "liberica-jdk-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "liberica-jdk-fips";
      "org.opencontainers.image.description" = "liberica-jdk-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
