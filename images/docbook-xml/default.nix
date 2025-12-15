{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# docbook-xml
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
  name = "docbook-xml";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "docbook-xml-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "docuook xml";
      "org.opencontainers.image.description" = "docbook-xml container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
