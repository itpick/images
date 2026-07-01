# policy-reporter
# =============
# Kyverno Policy Reporter - Monitoring and Observability Tool for PolicyReport CRD
# https://github.com/kyverno/policy-reporter

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for policy-reporter:
# Packages NOT in nixpkgs - must build from source

let
  version = "3.3.2";
  policy-reporter = buildGoModule {
    pname = "policy-reporter";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "policy-reporter";
      rev = "policy-reporter-${version}";
      hash = "sha256-p5li2A4NKEokXjqSVGCmOpUkEfsjX0KHlmqG9WZqD00=";
    };

    vendorHash = "sha256-N4VgV0vAkbVwsIzWN9oEETktYEdL3WIYpmrkpce237A=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kyverno Policy Reporter - Monitoring and Observability for PolicyReport CRD";
      homepage = "https://github.com/kyverno/policy-reporter";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = policy-reporter;
  name = "policy-reporter";
  tag = "v${version}";
  entrypoint = [ "${policy-reporter}/bin/policy-reporter" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Policy Reporter";
    "org.opencontainers.image.description" = "Kyverno Policy Reporter - Monitoring and Observability for PolicyReport CRD";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "policy-reporter";
  };
}
