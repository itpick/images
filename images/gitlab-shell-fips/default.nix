{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab shell-fips
# GitLab component: shell

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
  name = "gitlab-shell-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-shell-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab shell";
      "org.opencontainers.image.description" = "GitLab shell component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
