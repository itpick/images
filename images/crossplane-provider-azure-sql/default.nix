{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - azure-sql
# https://github.com/crossplane-contrib/provider-azure-sql

let
  version = "0.1.0";
  provider-azure-sql = buildGoModule {
    pname = "provider-azure-sql";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure-sql";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for azure-sql";
      homepage = "https://github.com/crossplane-contrib/provider-azure-sql";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-azure-sql;
  name = "crossplane-provider-azure-sql";
  tag = "v${version}";
  entrypoint = [ "${provider-azure-sql}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider azure sql";
    "org.opencontainers.image.description" = "Crossplane provider for azure-sql";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
