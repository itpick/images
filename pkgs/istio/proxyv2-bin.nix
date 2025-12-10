# Istio proxyv2 binaries extracted from official Docker image
# https://hub.docker.com/r/istio/proxyv2
#
# Contains:
# - pilot-agent: Go binary (statically linked)
# - envoy: C++ binary (dynamically linked, requires glibc)

{ lib
, stdenvNoCC
, fetchurl
, runCommand
, skopeo
, jq
, gnutar
, gzip
, autoPatchelfHook
, stdenv
, glibc
}:

let
  version = "1.24.0";

  # Architecture-specific image digest
  imageDigest = {
    "aarch64-linux" = "sha256:952004b3132571f4ec0bd86eb8566e2c124441a98a027758b07ab83adaf5057a";
    "x86_64-linux" = "sha256:xxxxxx"; # Add x86_64 digest if needed
  };

  # We'll fetch specific layers from the OCI registry
  # Layer containing /usr/local/bin/envoy and /usr/local/bin/pilot-agent
  binLayer = fetchurl {
    # This is the layer containing the binaries
    url = "https://registry-1.docker.io/v2/istio/proxyv2/blobs/sha256:732c3e34810eb6317ddfcde6a41189841bd57a001166f823d8a44aa3aab4e380";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    # Note: Docker Hub requires authentication for blob downloads
  };

in stdenv.mkDerivation {
  pname = "istio-proxyv2-bin";
  inherit version;

  # We'll use the pre-extracted binaries
  src = null;
  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ glibc stdenv.cc.cc.lib ];

  # Copy from pre-extracted location (built during image build)
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    # These will be sourced from the extraPaths in the image definition
    runHook postInstall
  '';

  meta = with lib; {
    description = "Istio proxyv2 binaries (envoy + pilot-agent)";
    homepage = "https://istio.io";
    license = licenses.asl20;
    platforms = [ "aarch64-linux" "x86_64-linux" ];
  };
}
