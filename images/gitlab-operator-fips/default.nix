{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# GitLab Operator-fips
# https://gitlab.com/gitlab-org/cloud-native/gitlab-operator

let
  version = "1.7.0";
  gitlab-operator-fips = buildGoModule {
    pname = "gitlab-operator-fips";
    inherit version;

    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "cloud-native/gitlab-operator";
      rev = version;
      hash = "sha256-DH3/72EKKkFeAPoNBFChNSWlNxqjpF4UL07fdtbE/oE=";
    };

    vendorHash = null;
    subPackages = [ "." ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = gitlab-operator-fips;
  name = "gitlab-operator-fips";
  tag = "v${version}";
  entrypoint = [ "${gitlab-operator-fips}/bin/gitlab-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Operator";
    "org.opencontainers.image.description" = "GitLab Kubernetes Operator";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
