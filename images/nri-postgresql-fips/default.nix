{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-postgresql-fips
# NRI (Node Resource Interface) plugin

let
  version = "2.23.0";
  nri-plugin = buildGoModule {
    pname = "nri-postgresql-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-postgresql";
      rev = "v${version}";
      hash = "sha256-1XdSKwtQ5UbrcRKBMLATOtORb6BzE1fP5DJfXddbMKo=";
    };

    vendorHash = null;
    subPackages = [ "cmd/postgresql" ];
    
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-postgresql-fips";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/postgresql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri postgresql";
    "org.opencontainers.image.description" = "NRI plugin nri-postgresql";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
