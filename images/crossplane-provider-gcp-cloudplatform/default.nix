{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-cloudplatform
# https://github.com/crossplane-contrib/provider-gcp-cloudplatform

let
  version = "0.1.0";
  provider-gcp-cloudplatform = buildGoModule {
    pname = "provider-gcp-cloudplatform";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-cloudplatform";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for gcp-cloudplatform";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-cloudplatform";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-cloudplatform;
  name = "crossplane-provider-gcp-cloudplatform";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-cloudplatform}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp cloudplatform";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-cloudplatform";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
