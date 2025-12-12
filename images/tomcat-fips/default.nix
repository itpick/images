{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tomcat-fips
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
  name = "tomcat-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tomcat-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tomcat-fips";
      "org.opencontainers.image.description" = "tomcat-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
