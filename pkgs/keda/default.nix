{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda
# Builds all 3 KEDA binaries: keda (operator), keda-adapter, keda-admission-webhooks

buildGoModule rec {
  pname = "keda";
  version = "2.18.1";

  src = fetchFromGitHub {
    owner = "kedacore";
    repo = "keda";
    rev = "v${version}";
    hash = "sha256-pfIzNyph6re2I0Cv9bganIEVVveEjDQOCsBiJFMesQo=";
  };

  # KEDA includes vendor directory
  vendorHash = null;

  # Build all 3 components
  subPackages = [
    "cmd/operator"
    "cmd/adapter"
    "cmd/webhooks"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kedacore/keda/v2/version.Version=${version}"
    "-X github.com/kedacore/keda/v2/version.GitCommit=b7c5655a"
  ];

  # Rename binaries to match expected names
  postInstall = ''
    mv $out/bin/operator $out/bin/keda
    mv $out/bin/adapter $out/bin/keda-adapter
    mv $out/bin/webhooks $out/bin/keda-admission-webhooks
  '';

  doCheck = false;

  meta = with lib; {
    description = "KEDA is a Kubernetes-based Event Driven Autoscaling component";
    homepage = "https://github.com/kedacore/keda";
    license = licenses.asl20;
  };
}
