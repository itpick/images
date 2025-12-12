{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab rails ce-fips
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
  name = "gitlab-rails-ce-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-rails-ce-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab rails ce";
      "org.opencontainers.image.description" = "GitLab rails-ce component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
