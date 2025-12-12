{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-mssql
# NRI (Node Resource Interface) plugin

let
  version = "0.1.0";
  nri-plugin = buildGoModule {
    pname = "nri-mssql";
    inherit version;

    src = fetchFromGitHub {
      owner = "containerd";
      repo = "nri-plugins";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
