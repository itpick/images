{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# erl28-elixir
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
  name = "erl28-elixir";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "erl28-elixir-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "erl28 elixir";
      "org.opencontainers.image.description" = "erl28-elixir container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
