{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab runner-fips
# GitLab component: runner

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
  name = "gitlab-runner-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-runner-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab runner";
      "org.opencontainers.image.description" = "GitLab runner component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
