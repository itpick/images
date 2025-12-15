{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab rails scripts-fips
# GitLab component: rails-scripts

let
  componentPkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "gitlab-rails-scripts-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-rails-scripts-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab rails scripts";
      "org.opencontainers.image.description" = "GitLab rails-scripts component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
