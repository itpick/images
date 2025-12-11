# harbor-jobservice
# =============
# Harbor Job Service - Background job execution for Harbor
# https://github.com/goharbor/harbor

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Job Service handles background tasks like replication, scanning, etc.

let
  version = "2.14.1";
  harbor-jobservice = buildGoModule {
    pname = "harbor-jobservice";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    sourceRoot = "source/src";

    subPackages = [ "jobservice" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/goharbor/harbor/src/common/utils.ReleaseVersion=v${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/jobservice $out/bin/harbor-jobservice
    '';

    meta = with lib; {
      description = "Harbor Job Service - Background job execution";
      homepage = "https://github.com/goharbor/harbor";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-jobservice;
  name = "harbor-jobservice";
  tag = "v${version}";
  entrypoint = [ "${harbor-jobservice}/bin/harbor-jobservice" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  env = {
    CONFIG_PATH = "/etc/jobservice/config.yml";
  };

  labels = {
    "org.opencontainers.image.title" = "Harbor Job Service";
    "org.opencontainers.image.description" = "Background job execution for Harbor registry";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
