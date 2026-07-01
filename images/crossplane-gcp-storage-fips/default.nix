{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# crossplane-gcp-storage-fips
# Crossplane provider/component

let
  version = "0.22.0";
  component = buildGoModule {
    pname = "crossplane-gcp-storage-fips";
    inherit version;
    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp";
      rev = "v${version}";
      hash = "sha256-A4wrBy8zNtbKF6zFPoJHGHqPbPZSUVbWzX0TJvfVAuo=";
    };
    vendorHash = "sha256-WmxxE5BEkGTn5wayO7QsXd8OnHFFQ8SYJzUJ7wH9KOI=";
    subPackages = [ "cmd/provider" ];
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";
    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in mkImage {
  drv = component;
  name = "crossplane-gcp-storage-fips";
  tag = "v${version}";
  entrypoint = [ "${component}/bin/provider" ];
  cmd = [];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "crossplane-gcp-storage-fips";
    "org.opencontainers.image.description" = "Crossplane crossplane-gcp-storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
