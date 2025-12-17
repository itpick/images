{ mkImage, fetchFromGitLab, buildGoModule, pkgs, lib, ... }:

# gitlab-mailroom-fips
# GitLab component

let
  version = "17.6.0";
  component = buildGoModule {
    pname = "gitlab-mailroom-fips";
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
  name = "gitlab-mailroom-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/gitlab-mailroom" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata git ];
  labels = {
    "org.opencontainers.image.title" = "gitlab-mailroom-fips";
    "org.opencontainers.image.description" = "GitLab gitlab-mailroom";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
