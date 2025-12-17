{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-couchbase
# NRI (Node Resource Interface) plugin

let
  version = "2.8.4";
  nri-plugin = buildGoModule {
    pname = "nri-couchbase";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-couchbase";
      rev = "v${version}";
      hash = "sha256-JoUVMeT/DnCCvsl13WaaNbtoedb38QzAKgYopm1kCHM=";
    };

    vendorHash = null;
    subPackages = [ "cmd/couchbase" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-couchbase";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/couchbase" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri couchuase";
    "org.opencontainers.image.description" = "NRI plugin nri-couchbase";
    "org.opencontainers.image.version" = version;
  };
}
