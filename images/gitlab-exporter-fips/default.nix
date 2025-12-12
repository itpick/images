{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# gitlab-exporter-fips
# GitLab component

let
  version = "17.6.0";
  component = buildGoModule {
    pname = "gitlab-exporter-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "gitlab-org";
      repo = "gitlab";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
  name = "gitlab-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/gitlab-exporter" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert tzdata git ];
  labels = {
    "org.opencontainers.image.title" = "gitlab-exporter-fips";
    "org.opencontainers.image.description" = "GitLab gitlab-exporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "gitlab";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
