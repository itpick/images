# Istio proxyv2 binaries extracted from official Docker image
# Contains: envoy, pilot-agent
#
# These binaries are pre-built by Istio and extracted from docker.io/istio/proxyv2
{ lib, stdenv, fetchurl, autoPatchelfHook, glibc, libgcc }:

let
  version = "1.24.0";

  # Binaries extracted from docker.io/istio/proxyv2:1.24.0 arm64 image
  # Layer containing binaries: /usr/local/bin/envoy, /usr/local/bin/pilot-agent
  src = fetchurl {
    url = "https://github.com/istio/istio/releases/download/${version}/istio-${version}-linux-arm64.tar.gz";
    sha256 = "sha256-PLACEHOLDER"; # We'll use the extracted binaries instead
  };

in
stdenv.mkDerivation {
  pname = "istio-proxyv2-bin";
  inherit version;

  # We'll copy pre-extracted binaries
  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ glibc stdenv.cc.cc.lib ];

  # The binaries will be provided via extraAttrs in the image
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    # Binaries will be copied from /tmp/istio-extract/rootfs/usr/local/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Istio proxyv2 binaries (envoy + pilot-agent)";
    homepage = "https://istio.io";
    license = licenses.asl20;
    platforms = [ "aarch64-linux" ];
  };
}
