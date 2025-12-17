{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-nagios
# NRI (Node Resource Interface) plugin

let
  version = "2.11.4";
  nri-plugin = buildGoModule {
    pname = "nri-nagios";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-nagios";
      rev = "v${version}";
      hash = "sha256-wLfYUfj0ZRxAHCr4bCSogDOdE1sk2a7di5TIOOdMIEM=";
    };

    vendorHash = null;
    subPackages = [ "cmd/nagios" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-nagios";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/nagios" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri nagios";
    "org.opencontainers.image.description" = "NRI plugin nri-nagios";
    "org.opencontainers.image.version" = version;
  };
}
