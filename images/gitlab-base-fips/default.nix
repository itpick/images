{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab Base Image-fips
# Base image for GitLab components

let
  basePkgs = with pkgs; [
    bash
    coreutils
    findutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "gitlab-base-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-base-fips-root";
      paths = base.basePackages ++ basePkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab Base";
      "org.opencontainers.image.description" = "Base image for GitLab components";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
