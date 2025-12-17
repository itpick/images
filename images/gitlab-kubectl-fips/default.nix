{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# gitlab-kubectl-fips
# GitLab component

let
  version = "17.6.0";
  component = buildGoModule {
    pname = "gitlab-kubectl-fips";
    inherit version;
    src = fetchFromGitLab {
      owner = "gitlab-org";
      repo = "gitlab-foss";
      rev = "v${version}";
      hash = "sha256-2dZumkupbqOouKZaPPnKAVINjiLFW63wYVNj0klvRoo=";
    };
    vendorHash = null;
    subPackages = [ "." ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "gitlab-kubectl-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/gitlab-kubectl" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata git ];
  labels = {
    "org.opencontainers.image.title" = "gitlab-kubectl-fips";
    "org.opencontainers.image.description" = "GitLab gitlab-kubectl";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
