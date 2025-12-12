{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - azure-authorization
# https://github.com/crossplane-contrib/provider-azure-authorization

let
  version = "0.1.0";
  provider-azure-authorization = buildGoModule {
    pname = "provider-azure-authorization";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure-authorization";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for azure-authorization";
      homepage = "https://github.com/crossplane-contrib/provider-azure-authorization";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-azure-authorization;
  name = "crossplane-provider-azure-authorization";
  tag = "v${version}";
  entrypoint = [ "${provider-azure-authorization}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider azure authorization";
    "org.opencontainers.image.description" = "Crossplane provider for azure-authorization";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
