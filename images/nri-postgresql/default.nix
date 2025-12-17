{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-postgresql
# NRI (Node Resource Interface) plugin

let
  version = "2.23.0";
  nri-plugin = buildGoModule {
    pname = "nri-postgresql";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-postgresql";
      rev = "v${version}";
      hash = "sha256-1XdSKwtQ5UbrcRKBMLATOtORb6BzE1fP5DJfXddbMKo=";
    };

    vendorHash = null;
    subPackages = [ "cmd/postgresql" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-postgresql";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/postgresql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri postgresql";
    "org.opencontainers.image.description" = "NRI plugin nri-postgresql";
    "org.opencontainers.image.version" = version;
  };
}
