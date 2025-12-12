{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - azure-family
# https://github.com/crossplane-contrib/provider-azure-family

let
  version = "0.1.0";
  provider-azure-family = buildGoModule {
    pname = "provider-azure-family";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure-family";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for azure-family";
      homepage = "https://github.com/crossplane-contrib/provider-azure-family";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-azure-family;
  name = "crossplane-provider-azure-family";
  tag = "v${version}";
  entrypoint = [ "${provider-azure-family}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider azure family";
    "org.opencontainers.image.description" = "Crossplane provider for azure-family";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
