{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# katib-suggestion-hyperband
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
  name = "katib-suggestion-hyperband";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "katib-suggestion-hyperband-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "katiu suggestion hyperuand";
      "org.opencontainers.image.description" = "katib-suggestion-hyperband container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
