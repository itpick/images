# katib-ui
# =============
# Katib UI - Web dashboard for Katib experiments
# https://github.com/kubeflow/katib

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Katib UI provides a web interface for managing hyperparameter tuning experiments

let
  version = "0.19.0";
  katib-ui = buildGoModule {
    pname = "katib-ui";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "katib";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/ui" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/ui $out/bin/katib-ui
    '';

    meta = with lib; {
      description = "Katib UI - Web dashboard for experiments";
      homepage = "https://github.com/kubeflow/katib";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = katib-ui;
  name = "katib-ui";
  tag = "v${version}";
  entrypoint = [ "${katib-ui}/bin/katib-ui" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  env = {
    KATIB_UI_PORT = "8080";
  };

  labels = {
    "org.opencontainers.image.title" = "Katib UI";
    "org.opencontainers.image.description" = "Web dashboard for Katib experiments";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "katib";
  };
}
