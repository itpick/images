{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab sidekiq ce-fips
# GitLab component: sidekiq-ce

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
  name = "gitlab-sidekiq-ce-fips";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-sidekiq-ce-fips-root";
      paths = base.basePackages ++ componentPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab sidekiq ce";
      "org.opencontainers.image.description" = "GitLab sidekiq-ce component";
      "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
