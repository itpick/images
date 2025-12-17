{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-apache
# NRI (Node Resource Interface) plugin

let
  version = "1.15.4";
  nri-plugin = buildGoModule {
    pname = "nri-apache";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-apache";
      rev = "v${version}";
      hash = "sha256-1y40yRmJ/QURszmrbUcctZtqF49I98Uq1i4bP5FQYgw=";
    };

    vendorHash = null;
    subPackages = [ "cmd/apache" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-apache";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/apache" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri apache";
    "org.opencontainers.image.description" = "NRI plugin nri-apache";
    "org.opencontainers.image.version" = version;
  };
}
