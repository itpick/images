{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# liberica-jre-fips
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
  name = "liberica-jre-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "liberica-jre-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "liberica-jre-fips";
      "org.opencontainers.image.description" = "liberica-jre-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
