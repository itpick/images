{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab workhorse scripts-fips
# GitLab component: workhorse-scripts

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
  name = "gitlab-workhorse-scripts-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-workhorse-scripts-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab workhorse scripts";
      "org.opencontainers.image.description" = "GitLab workhorse-scripts component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
