{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# erl27-elixir
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
  name = "erl27-elixir";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "erl27-elixir-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "erl27 elixir";
      "org.opencontainers.image.description" = "erl27-elixir container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
