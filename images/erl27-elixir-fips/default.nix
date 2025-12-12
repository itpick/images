{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# erl27-elixir-fips
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
  name = "erl27-elixir-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "erl27-elixir-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "erl27 elixir fips";
      "org.opencontainers.image.description" = "erl27-elixir-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
