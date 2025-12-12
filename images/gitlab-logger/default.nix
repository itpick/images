{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# GitLab Logger
# Logging sidecar for GitLab components

let
  loggerPkgs = with pkgs; [
    bash
    coreutils
    findutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "gitlab-logger";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "gitlab-logger-root";
      paths = base.basePackages ++ loggerPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Cmd = [ "tail" "-f" "/dev/null" ];
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "GitLab Logger";
      "org.opencontainers.image.description" = "Logging sidecar for GitLab";
      "io.nix-containers.chart" = "gitlab";
    };
  };
}
