{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpg-wks-server
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
  name = "gpg-wks-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gpg-wks-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "gpg wks server";
      "org.opencontainers.image.description" = "gpg-wks-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
