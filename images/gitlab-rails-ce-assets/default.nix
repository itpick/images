{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab rails ce assets
# GitLab component: rails-ce-assets

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
  name = "gitlab-rails-ce-assets";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-rails-ce-assets-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "GitLab rails ce assets";
      "org.opencontainers.image.description" = "GitLab rails-ce-assets component";
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
