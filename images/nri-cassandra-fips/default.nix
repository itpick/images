{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-cassandra-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.16.1";
  nri-plugin = buildGoModule {
    pname = "nri-cassandra-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-cassandra";
      rev = "v${version}";
      hash = "sha256-OawEoG1iPnrni+RuAMEu8r8v9bNV0LkKFe4naocfF2A=";
    };

    vendorHash = null;
    subPackages = [ "cmd/cassandra" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-cassandra-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/cassandra" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri cassandra";
    "org.opencontainers.image.description" = "NRI plugin nri-cassandra";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
