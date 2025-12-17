{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-mongodb-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.10.2";
  nri-plugin = buildGoModule {
    pname = "nri-mongodb-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-mongodb";
      rev = "v${version}";
      hash = "sha256-vlp+bzvesqMguv9iTJ+MEEKiA6C/hpChMtpaWRzOkUQ=";
    };

    vendorHash = null;
    subPackages = [ "cmd/mongodb" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-mongodb-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/mongodb" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri mongodb";
    "org.opencontainers.image.description" = "NRI plugin nri-mongodb";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
