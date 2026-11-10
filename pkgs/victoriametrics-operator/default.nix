# VictoriaMetrics Operator - Kubernetes operator for VictoriaMetrics
# https://github.com/VictoriaMetrics/operator
#
# Built from source. This used to extract the binary from upstream's
# container image, which froze whatever Go toolchain upstream built with
# (go1.26.4 in 0.71.0, carrying stdlib Criticals) and could not be rebuilt.

{ lib, buildGoModule, fetchFromGitHub }:

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };
in

buildGoModule (finalAttrs: {
  pname = "victoriametrics-operator";
  version = "0.75.2";

  src = fetchFromGitHub {
    owner = "VictoriaMetrics";
    repo = "operator";
    tag = "v${finalAttrs.version}";
    hash = "sha256-C63ZwSU30jsmFV/tIU18Uv+ZJvuPuIZwj0INrlE6Rsw=";
  };

  vendorHash = "sha256-v9A73zkjIGCenqPe9Pwel9rjO6KniSIjtcgkb8Zve9E=";

  # Upstream's `make build` compiles ./cmd (main.go); config-reloader and
  # helm-converter are separate binaries we do not ship here.
  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;
  doCheck = false;

  ldflags = [
    "-s" "-w"
    "-X 'github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=operator-v${finalAttrs.version}'"
  ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/vm-operator
  '';

  meta = with lib; {
    description = "Kubernetes operator for VictoriaMetrics";
    homepage = "https://github.com/VictoriaMetrics/operator";
    license = licenses.asl20;
    mainProgram = "vm-operator";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
} // goModBump [
  "github.com/klauspost/compress@v1.20.2"
])
