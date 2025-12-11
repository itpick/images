# katib-db-manager
# =============
# Katib DB Manager - Database manager for Katib experiments
# https://github.com/kubeflow/katib

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Katib DB Manager handles database operations for experiment tracking

let
  version = "0.19.0";
  katib-db-manager = buildGoModule {
    pname = "katib-db-manager";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "katib";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/db-manager" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/db-manager $out/bin/katib-db-manager
    '';

    meta = with lib; {
      description = "Katib DB Manager - Database manager for experiments";
      homepage = "https://github.com/kubeflow/katib";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = katib-db-manager;
  name = "katib-db-manager";
  tag = "v${version}";
  entrypoint = [ "${katib-db-manager}/bin/katib-db-manager" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  env = {
    DB_NAME = "katib";
  };

  labels = {
    "org.opencontainers.image.title" = "Katib DB Manager";
    "org.opencontainers.image.description" = "Database manager for Katib experiments";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "katib";
  };
}
