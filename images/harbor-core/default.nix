# harbor-core
# =============
# Harbor Core - Central component of Harbor registry
# https://github.com/goharbor/harbor

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Core is the central component managing API, authentication, and project management

let
  version = "2.14.1";
  harbor-core = buildGoModule {
    pname = "harbor-core";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    sourceRoot = "source/src";

    subPackages = [ "core" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/goharbor/harbor/src/common/utils.ReleaseVersion=v${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/core $out/bin/harbor-core
    '';

    meta = with lib; {
      description = "Harbor Core - Central component of Harbor registry";
      homepage = "https://github.com/goharbor/harbor";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-core;
  name = "harbor-core";
  tag = "v${version}";
  entrypoint = [ "${harbor-core}/bin/harbor-core" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  env = {
    CONFIG_PATH = "/etc/core/app.conf";
  };

  labels = {
    "org.opencontainers.image.title" = "Harbor Core";
    "org.opencontainers.image.description" = "Central component of Harbor registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
