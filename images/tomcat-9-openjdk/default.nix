{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tomcat-9-openjdk
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
  name = "tomcat-9-openjdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tomcat-9-openjdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tomcat 9 openjdk";
      "org.opencontainers.image.description" = "tomcat-9-openjdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
