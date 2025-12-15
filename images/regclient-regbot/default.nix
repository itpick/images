{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# regclient-regbot
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
  name = "regclient-regbot";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "regclient-regbot-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "regclient reguot";
      "org.opencontainers.image.description" = "regclient-regbot container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
