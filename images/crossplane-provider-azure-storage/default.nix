{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - azure-storage
# https://github.com/crossplane-contrib/provider-azure-storage

let
  version = "0.1.0";
  provider-azure-storage = buildGoModule {
    pname = "provider-azure-storage";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-azure-storage";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for azure-storage";
      homepage = "https://github.com/crossplane-contrib/provider-azure-storage";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-azure-storage;
  name = "crossplane-provider-azure-storage";
  tag = "v${version}";
  entrypoint = [ "${provider-azure-storage}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider azure storage";
    "org.opencontainers.image.description" = "Crossplane provider for azure-storage";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
