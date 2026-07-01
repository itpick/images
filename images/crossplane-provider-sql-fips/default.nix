{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Crossplane Provider - sql
# https://github.com/crossplane-contrib/provider-sql

let
  version = "0.1.0";
  provider-sql = buildGoModule {
    pname = "provider-sql-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-sql";
      rev = "v${version}";
      hash = "sha256-bWHqUZR0NgZxaPMsDbtr3bSyKdntKle0+YxabSXbf50=";
    };

    vendorHash = "sha256-8qExPoCI8gwwdcR+5iojcSYbKy1uGVg0cXL7D7cFPwg=";

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;

    meta = with lib; {
      description = "Crossplane provider for sql";
      homepage = "https://github.com/crossplane-contrib/provider-sql";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-sql;
  name = "crossplane-provider-sql-fips";
  tag = "v${version}";
  entrypoint = [ "${provider-sql}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider sql";
    "org.opencontainers.image.description" = "Crossplane provider for sql";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
