{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thingsboard-tb-web-ui
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
  name = "thingsboard-tb-web-ui";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thingsboard-tb-web-ui-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "thingsuoard tu weu ui";
      "org.opencontainers.image.description" = "thingsboard-tb-web-ui container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
