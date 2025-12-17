{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-apache-fips
# NRI (Node Resource Interface) plugin

let
  version = "1.15.4";
  nri-plugin = buildGoModule {
    pname = "nri-apache-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-apache";
      rev = "v${version}";
      hash = "sha256-1y40yRmJ/QURszmrbUcctZtqF49I98Uq1i4bP5FQYgw=";
    };

    vendorHash = null;
    subPackages = [ "cmd/apache" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-apache-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/apache" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri apache";
    "org.opencontainers.image.description" = "NRI plugin nri-apache";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
