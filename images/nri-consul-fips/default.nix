{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-consul-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.9.5";
  nri-plugin = buildGoModule {
    pname = "nri-consul-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-consul";
      rev = "v${version}";
      hash = "sha256-TOV8T5TxKHL8/1BnrO/ipYTruZJnuvJYKDzYkJ8cvic=";
    };

    vendorHash = null;
    subPackages = [ "cmd/consul" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-consul-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/consul" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri consul";
    "org.opencontainers.image.description" = "NRI plugin nri-consul";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
