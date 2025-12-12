{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# solr
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
  name = "solr";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "solr-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "solr";
      "org.opencontainers.image.description" = "solr container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
