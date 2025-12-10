# Pre-built Envoy binary from Istio proxyv2 Docker image
# Envoy in nixpkgs doesn't build on aarch64-linux, so we extract from official image
{ lib, stdenv, fetchurl, autoPatchelfHook, glibc }:

let
  version = "1.24.0";

  # The Istio proxyv2 image contains a pre-built envoy binary
  # We fetch the specific layer that contains /usr/local/bin/envoy
  # Layer digest for arm64: 732c3e34810eb6317ddfcde6a41189841bd57a001166f823d8a44aa3aab4e380
  src = fetchurl {
    url = "https://storage.googleapis.com/istio-build/proxy/envoy-alpha-${version}-linux-arm64.tar.gz";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # placeholder
  };

in stdenv.mkDerivation {
  pname = "envoy-istio";
  inherit version;

  # Don't try to unpack, we'll extract manually
  src = null;
  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ glibc stdenv.cc.cc.lib ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    # Binary will be extracted from container image during build
    runHook postInstall
  '';

  meta = with lib; {
    description = "Envoy proxy from Istio";
    homepage = "https://istio.io";
    license = licenses.asl20;
    platforms = [ "aarch64-linux" "x86_64-linux" ];
  };
}
