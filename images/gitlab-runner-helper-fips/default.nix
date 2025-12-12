{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab runner helper-fips
# GitLab component: runner-helper

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
  name = "gitlab-runner-helper-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-runner-helper-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab runner helper";
      "org.opencontainers.image.description" = "GitLab runner-helper component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
