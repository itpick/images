# VictoriaMetrics Operator FIPS - FIPS 140-3 compliant Kubernetes operator
# https://github.com/VictoriaMetrics/operator
#
# Extracts pre-built FIPS binary from the official container image

{ lib, stdenvNoCC, crane, cacert }:

let
  version = "0.66.1";
  imageRef = "victoriametrics/operator:v${version}-fips";

  # Layer digests containing the FIPS binary for each architecture
  layerDigests = {
    amd64 = "sha256:a998f23bfde11cec7f51d5333a6e399a1cb788cfa5205116c9e15c43dd0a4dcb";
    arm64 = "sha256:df7c798306f3b77b9613de37a4376a4d09b05c9bf01fba7da1182250b457ec55";
  };

  # Output hashes for the fixed-output derivation
  outputHashes = {
    amd64 = "sha256-yW9yuhpYnn1CjUcHwu7JBSOGYAZdNNtCUa4TjnMBpBA=";
    arm64 = "sha256-xS6AJy1D7XC7BWgMtKnvV4/q3Ll8iPC0uTPylEWQgCc=";
  };

  arch = if stdenvNoCC.hostPlatform.isAarch64 then "arm64" else "amd64";
in
stdenvNoCC.mkDerivation {
  pname = "victoriametrics-operator-fips";
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

  passthru = {
    inherit version;
    isFips = true;
  };

  meta = with lib; {
    description = "VictoriaMetrics Operator FIPS 140-3 compliant build";
    homepage = "https://github.com/VictoriaMetrics/operator";
    license = licenses.asl20;
    mainProgram = "vm-operator";
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
