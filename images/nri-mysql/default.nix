{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# nri-mysql
# NRI (Node Resource Interface) plugin

let
  version = "1.18.2";
  nri-plugin = buildGoModule {
    pname = "nri-mysql";
    inherit version;

    src = fetchFromGitHub {
      owner = "newrelic";
      repo = "nri-mysql";
      rev = "v${version}";
      hash = "sha256-8z/LAEyXHEHoZgmQ601fock7rO5t4qadZdP9Tiuqxds=";
    };

    vendorHash = null;
    subPackages = [ "cmd/mysql" ];
    
    env.CGO_ENABLED = 0;

    ldflags = [ "-s" "-w" ];
    doCheck = false;
  };

in
mkImage {
  drv = nri-plugin;
  name = "nri-mysql";
  tag = "v${version}";
  entrypoint = [ "${nri-plugin}/bin/mysql" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "nri mysql";
    "org.opencontainers.image.description" = "NRI plugin nri-mysql";
    "org.opencontainers.image.version" = version;
  };
}
