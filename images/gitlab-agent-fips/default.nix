{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# GitLab Agent (kas)-fips
# https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent

let
  version = "18.7.0";
  gitlab-agent-fips = buildGoModule {
    pname = "gitlab-agent-fips";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "cluster-integration/gitlab-agent";
      rev = "v${version}";
      hash = "sha256-2TYqFLc5UxJ7S5dk0rTiT2hko5ZfATn6upZ+DEBgFFk=";
    };

    proxyVendor = true;
    vendorHash = "sha256-vAAetRPslNBEdTREeLfmkemDGWS+EwCuCFzkxV79O94=";
    subPackages = [ "cmd/kas" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-agent-fips;
  name = "gitlab-agent-fips";
  tag = "v${version}";
  entrypoint = [ "${gitlab-agent-fips}/bin/kas" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Agent";
    "org.opencontainers.image.description" = "GitLab Kubernetes Agent";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
