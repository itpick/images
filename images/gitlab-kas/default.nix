{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# GitLab KAS (Kubernetes Agent Server)
# https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent

let
  version = "17.10.1";
  gitlab-kas = buildGoModule {
    pname = "gitlab-kas";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "cluster-integration/gitlab-agent";
      rev = "v${version}";
      hash = "sha256-eupwFR1XQLCJc99E80d+CTuPM2zj6o8HauYW+ObeVfU=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kas" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-kas;
  name = "gitlab-kas";
  tag = "v${version}";
  entrypoint = [ "${gitlab-kas}/bin/kas" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab KAS";
    "org.opencontainers.image.description" = "GitLab Kubernetes Agent Server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
  };
}
