# policy-reporter-ui
# =============
# Policy Reporter UI - Web dashboard for Policy Reporter
# https://github.com/kyverno/policy-reporter-ui

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Policy Reporter UI provides a web dashboard for viewing policy reports

let
  version = "2.5.0";
  policy-reporter-ui = buildGoModule {
    pname = "policy-reporter-ui";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "policy-reporter-ui";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Policy Reporter UI - Web dashboard for policy reports";
      homepage = "https://github.com/kyverno/policy-reporter-ui";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = policy-reporter-ui;
  name = "policy-reporter-ui";
  tag = "v${version}";
  entrypoint = [ "${policy-reporter-ui}/bin/policy-reporter-ui" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  env = {
    PORT = "8080";
  };

  labels = {
    "org.opencontainers.image.title" = "Policy Reporter UI";
    "org.opencontainers.image.description" = "Web dashboard for Policy Reporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "policy-reporter";
  };
}
