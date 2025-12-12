{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tomcat-10.1-openjdk-21-fips
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "tomcat-10.1-openjdk-21-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tomcat-10.1-openjdk-21-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tomcat 10.1 openjdk 21 fips";
      "org.opencontainers.image.description" = "tomcat-10.1-openjdk-21-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
