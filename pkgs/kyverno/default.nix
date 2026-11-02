{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/kyverno/kyverno

buildGoModule rec {
  pname = "kyverno";
  # Was pinned to "kyverno-policies-chart-3.9.1" -- a DIFFERENT kyverno/kyverno
  # release track (the policies Helm chart, not the app), so `rev =
  # "v${version}"` resolved to a nonexistent ref. The corresponding `hash`
  # was, by coincidence or a partial prior fix, already correct for the
  # real v1.19.1 app release -- verified independently via
  # `nix-prefetch-github kyverno kyverno --rev v1.19.1` returning the exact
  # same hash. Fixing the version string to match what the hash actually is.
  version = "1.19.2";

  src = fetchFromGitHub {
    owner = "kyverno";
    repo = "kyverno";
    rev = "v${version}";
    hash = "sha256-Q94qvOTrGl/82cooREqFAw+G7lY/tnpmaOb1JA2ZYOQ=";
  };

  vendorHash = null;

  subPackages = [
    "cmd/kyverno"
    "cmd/cli/kubectl-kyverno"
    "cmd/cleanup-controller"
    "cmd/reports-controller"
    "cmd/background-controller"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kyverno/kyverno/pkg/version.BuildVersion=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Kubernetes native policy management";
    homepage = "https://kyverno.io/";
    license = licenses.asl20;
  };
}
