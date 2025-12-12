{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - gcp-dns
# https://github.com/crossplane-contrib/provider-gcp-dns

let
  version = "0.1.0";
  provider-gcp-dns = buildGoModule {
    pname = "provider-gcp-dns";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp-dns";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for gcp-dns";
      homepage = "https://github.com/crossplane-contrib/provider-gcp-dns";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp-dns;
  name = "crossplane-provider-gcp-dns";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp-dns}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider gcp dns";
    "org.opencontainers.image.description" = "Crossplane provider for gcp-dns";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
