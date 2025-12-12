{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-container
# https://github.com/crossplane-contrib/provider-gcp-container

let
  version = "0.1.0";
  provider-gcp-container = buildGoModule {
    pname = "provider-gcp-container";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-container";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for gcp-container";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-container";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-container;
  name = "crossplane-provider-gcp-container";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-container}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp container";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-container";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
