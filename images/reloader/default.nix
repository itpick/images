{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for reloader:
# Packages NOT in nixpkgs:
#   kube-logging-operator-config-reloader (6.2.1-r1)

let
  version = "1.4.17";
  reloader = buildGoModule {
    pname = "reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "stakater";
      repo = "Reloader";
      rev = "v${version}";
      hash = "sha256-V95gDRlP3noXbc1PO+U+g0LBoD6qlWG+EG3k2BNZTZI=";
    };

    proxyVendor = true;
    vendorHash = "sha256-H8ruUzLgCkhl4Yz9xEEDpuLED/Fr9Sg/RFwp8TBxKgg=";

    # 1.4.x removed the ./test/loadtest/cmd/loadtest submodule from the main
    # module tree — restrict to the main binary so buildGoModule doesn't try
    # to compile every subdir.
    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes controller to watch changes in ConfigMap and Secrets";
      homepage = "https://github.com/stakater/Reloader";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = reloader;
  name = "reloader";
  tag = "v${version}";
  entrypoint = [ "${reloader}/bin/Reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Reloader";
    "org.opencontainers.image.description" = "Watches ConfigMaps and Secrets and triggers rolling upgrades";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reloader";
  };
}
