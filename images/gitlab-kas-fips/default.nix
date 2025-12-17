{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# GitLab KAS (Kubernetes Agent Server)-fips
# https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent

let
  version = "17.10.1";
  gitlab-kas-fips = buildGoModule {
    pname = "gitlab-kas-fips";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "cluster-integration/gitlab-agent";
      rev = "v${version}";
      hash = "sha256-eupwFR1XQLCJc99E80d+CTuPM2zj6o8HauYW+ObeVfU=";
    };

    vendorHash = null;
    subPackages = [ "cmd/kas" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-kas-fips;
  name = "gitlab-kas-fips";
  tag = "v${version}";
  entrypoint = [ "${gitlab-kas-fips}/bin/kas" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab KAS";
    "org.opencontainers.image.description" = "GitLab Kubernetes Agent Server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
