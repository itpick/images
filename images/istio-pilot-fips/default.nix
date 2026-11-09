# istio-pilot-fips
# https://istio.io/

{ mkImage, pkgs, lib, ... }:

# GENUINELY FIPS, unlike every other istio-*-fips image before this. It uses
# pkgs.istio-fips, which builds pilot-discovery from istio/istio source with
# CGO_ENABLED=1 and GOEXPERIMENT=boringcrypto, rather than pkgs.istio, which
# extracts a stock prebuilt binary out of the official release image. Extraction
# can never yield a FIPS artifact, which is why the compliance label is earned
# here and was removed from the images that only carried the name.
#
# Verify, do not assume:
#   go version -m /path/to/pilot-discovery | grep GOEXPERIMENT
# must report boringcrypto, and the binary self-reports
# GolangVersion:"goX.Y.Z-X:boringcrypto" under `pilot-discovery version`.
#
# THE EDGE IS STILL NOT COVERED. Envoy is C++; GOEXPERIMENT does nothing for it
# and it needs Bazel --define boringssl=fips against the frozen FIPS-validated
# BoringSSL. istio-proxy-fips and istio-envoy-fips remain stock upstream and are
# labelled accordingly. External TLS terminates in Envoy, so this covers the
# control plane, xDS and mTLS crypto — not the ingress gateway.

let
  istio = pkgs.istio-fips;
  version = istio.version;
in
mkImage {
  drv = istio.pilot-discovery;
  name = "istio-pilot-fips";
  tag = version;
  entrypoint = [ "${istio.pilot-discovery}/bin/pilot-discovery" ];
  cmd = [ "discovery" ];

  extraPkgs = with pkgs; [
    busybox
    cacert
    # Same trimmed iptables as istio-proxyv2-fips: no libpcap RDMA -> perl.
    istio-fips.iptablesMin
  ];

  labels = {
    "org.opencontainers.image.title" = "Istio Pilot (FIPS/BoringCrypto)";
    "org.opencontainers.image.description" = "Istio control plane (istiod), built with GOEXPERIMENT=boringcrypto";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "istio";
    # Earned: the binary in this image is a BoringCrypto build. See the header.
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
