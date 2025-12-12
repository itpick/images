{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# elixir-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "elixir-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "elixir-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "elixir-fips";
      "org.opencontainers.image.description" = "elixir-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
