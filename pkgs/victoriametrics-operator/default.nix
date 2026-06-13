# VictoriaMetrics Operator - Kubernetes operator for VictoriaMetrics
# https://github.com/VictoriaMetrics/operator
#
# Extracts pre-built binary from the official container image
# Since Docker Hub requires authentication for blob access, we use runCommand with crane

{ lib, stdenvNoCC, crane, cacert }:

let
  version = "0.71.0";
  imageRef = "victoriametrics/operator:v${version}";

  # Layer digests containing the binary for each architecture
  layerDigests = {
    amd64 = "sha256:1f1a2c7ab2ba0095dc3a921f500af2f608b8efb058af695bc4a66455b638d463";
    arm64 = "sha256:f6b10b9b4818058bdcd819e21689ad60afe5c2cac2399af56873b62b06695aa0";
  };

  # Output hashes for the fixed-output derivation
  outputHashes = {
    amd64 = "sha256-NmXGN5IEeVxC0EcWawLS4mFGdnrqe7t9oyWIWP+hsCw=";
    arm64 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
