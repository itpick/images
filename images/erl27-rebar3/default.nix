{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# erl27-rebar3
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
  name = "erl27-rebar3";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "erl27-rebar3-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "erl27 reuar3";
      "org.opencontainers.image.description" = "erl27-rebar3 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
