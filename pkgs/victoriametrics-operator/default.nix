# VictoriaMetrics Operator - Kubernetes operator for VictoriaMetrics
# https://github.com/VictoriaMetrics/operator
#
# Extracts pre-built binary from the official container image
# Since Docker Hub requires authentication for blob access, we use runCommand with crane

{ lib, stdenvNoCC, crane, cacert }:

let
  version = "0.66.1";
  imageRef = "victoriametrics/operator:v${version}";

  # Layer digests containing the binary for each architecture
  layerDigests = {
    amd64 = "sha256:2e3f7ff84753d61ad72cd7bca62a7881aacc831a70ed3e17c9827ba2eff33477";
    arm64 = "sha256:be647599da3a7eedf4b0467a85311e2cc45a83bb63f86d5bc36fe03041cedd4c";
  };

  # Output hashes for the fixed-output derivation
  outputHashes = {
    amd64 = "sha256-MvnwD0nr9rGJj4KZOQeOkrcIC0PltbE4OLfRfzicOgM=";
    arm64 = "sha256-/XxyPhCnR6HdJMO5B66o8ly//610Emsv8EVxym1hzvA=";
  };

  arch = if stdenvNoCC.hostPlatform.isAarch64 then "arm64" else "amd64";
in
stdenvNoCC.mkDerivation {
  pname = "victoriametrics-operator";
  inherit version;

  # No src - we fetch during build
  dontUnpack = true;

  nativeBuildInputs = [ crane ];

  # crane needs SSL certs
  SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

  buildPhase = ''
    runHook preBuild
    mkdir -p extract
    crane blob ${imageRef}@${layerDigests.${arch}} | tar -xz -C extract
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m755 extract/app $out/bin/vm-operator
    runHook postInstall
  '';

  # Mark as not substitutable since we fetch at build time
  preferLocalBuild = true;

  # Fixed-output derivation to cache the result
  outputHashMode = "recursive";
  outputHashAlgo = "sha256";
  outputHash = outputHashes.${arch};

  meta = with lib; {
    description = "Kubernetes operator for VictoriaMetrics";
    homepage = "https://github.com/VictoriaMetrics/operator";
    license = licenses.asl20;
    mainProgram = "vm-operator";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
