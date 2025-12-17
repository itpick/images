{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-mssql
# NRI (Node Resource Interface) plugin

let
  version = "2.25.2";
  nri-plugin = buildGoModule {
    pname = "nri-mssql";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-mssql";
      rev = "v${version}";
      hash = "sha256-nQtYcfbcuBe6XGovlqq2gTwqKpU2mwEJRp30x8I/k6s=";
    };

    vendorHash = null;
    subPackages = [ "cmd/mssql" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-mssql";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/mssql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri mssql";
    "org.opencontainers.image.description" = "NRI plugin nri-mssql";
    "org.opencontainers.image.version" = version;
  };
}
