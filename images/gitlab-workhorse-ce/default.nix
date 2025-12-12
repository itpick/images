{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab workhorse ce
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
  name = "gitlab-workhorse-ce";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-workhorse-ce-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab workhorse ce";
      "org.opencontainers.image.description" = "GitLab workhorse-ce component";
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
