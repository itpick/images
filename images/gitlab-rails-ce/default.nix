{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab rails ce
# GitLab component: rails-ce

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
  name = "gitlab-rails-ce";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-rails-ce-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab rails ce";
      "org.opencontainers.image.description" = "GitLab rails-ce component";
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
