{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-jmx
# NRI (Node Resource Interface) plugin

let
  version = "3.11.2";
  nri-plugin = buildGoModule {
    pname = "nri-jmx";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-jmx";
      rev = "v${version}";
      hash = "sha256-b5A5my+s5F6PFaBCVnLQeTHZJiR+UKJdsS6OJJFC0sA=";
    };

    vendorHash = null;
    subPackages = [ "cmd/jmx" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-jmx";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/jmx" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri jmx";
    "org.opencontainers.image.description" = "NRI plugin nri-jmx";
    "org.opencontainers.image.version" = version;
  };
}
