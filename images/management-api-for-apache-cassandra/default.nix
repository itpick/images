{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# management-api-for-apache-cassandra
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
  name = "management-api-for-apache-cassandra";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "management-api-for-apache-cassandra-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "management api for apache cassandra";
      "org.opencontainers.image.description" = "management-api-for-apache-cassandra container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
