# mattermost-operator
# =============
# Mattermost Operator - Kubernetes Operator for Mattermost
# https://github.com/mattermost/mattermost-operator

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Mattermost Operator manages Mattermost deployments on Kubernetes

let
  version = "1.21.0";
  mattermost-operator = buildGoModule {
    pname = "mattermost-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "mattermost";
      repo = "mattermost-operator";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/mattermost/mattermost-operator/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Mattermost Operator for Kubernetes";
      homepage = "https://github.com/mattermost/mattermost-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = mattermost-operator;
  name = "mattermost-operator";
  tag = "v${version}";
  entrypoint = [ "${mattermost-operator}/bin/mattermost-operator" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Mattermost Operator";
    "org.opencontainers.image.description" = "Kubernetes Operator for managing Mattermost deployments";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "mattermost-operator";
  };
}
