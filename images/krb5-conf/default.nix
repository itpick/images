{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# krb5-conf
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
  name = "krb5-conf";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "krb5-conf-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kru5 conf";
      "org.opencontainers.image.description" = "krb5-conf container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
