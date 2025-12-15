{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab workhorse ce-fips
# GitLab component: workhorse-ce

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
  name = "gitlab-workhorse-ce-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-workhorse-ce-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab workhorse ce";
      "org.opencontainers.image.description" = "GitLab workhorse-ce component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
