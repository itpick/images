# istio-proxyv2-fips (Istio sidecar / gateway proxy)
# https://istio.io/
#
# CRYPTO MODULES, PER BINARY. proxyv2 is a combined image: pilot-agent is the
# entrypoint and it execs Envoy.
#
#   pilot-agent  BoringCrypto (pkgs.istio-fips, GOEXPERIMENT=boringcrypto)  CMVP #4735
#   envoy        AWS-LC FIPS 3.1.0, static, built per its Security Policy  CMVP #5314
#
# ENVOY TERMINATES EXTERNAL TLS at the ingress gateway. Its module is
# AWS-LC 3 Cryptographic Module (static) v3.1.0, see pkgs/istio-fips `envoy`
# for the build, the FIPS_202205 policy shim, and the operational-environment
# caveat: #5314 was tested on Amazon Linux 2023 only, so running elsewhere
# (e.g. GKE COS) is a user affirmation, not a CMVP-listed configuration.
#
# Both halves come from the same release: pilot-agent from istio/istio source at
# pkgs.istio-fips.version, envoy from PROXY_REPO_SHA as pinned in that tag's
# istio.deps — not a mix of versions.
#
# TRIMMED RUNTIME CLOSURE. iptables and iproute2 are kept (istio-iptables and
# TPROXY interception need them) but come from pkgs.istio-fips.iptablesMin /
# iproute2Min, which cut the RDMA (-> perl) and debuginfod (-> curl, openssl,
# libssh2, krb5) chains that put unpatched Critical CVEs into the 1.30.4 image.

{ mkImage, pkgs, lib, ... }:

let
  istio = pkgs.istio-fips;
  version = istio.version;
  # See TRIMMED RUNTIME CLOSURE above (defined in pkgs/istio-fips).
  inherit (istio) iptablesMin iproute2Min;
in
mkImage {
  drv = istio.proxyv2-bin;
  name = "istio-proxyv2-fips";
  tag = version;
  entrypoint = [ "${istio.proxyv2-bin}/bin/pilot-agent" ];
  cmd = [ "proxy" "sidecar" ];

  extraPkgs = with pkgs; [
    cacert
    # Exposes the bundle as /etc/ssl/certs/ca-certificates.crt, the first path
    # pilot-agent's security.GetOSRootFilePath() probes. cacert alone installs
    # it as ca-bundle.crt, which matches none of istio's candidates, so every
    # proxy logged "OS CA Cert could not be found for agent".
    istio-fips.osCaCompat
    iptablesMin
    iproute2Min
  ];

  noBusybox = true; # iproute2 conflicts with busybox

  env = {
    PATH = "/bin:${iptablesMin}/bin:${iproute2Min}/bin";
  };

  labels = {
    "org.opencontainers.image.title" = "Istio Proxy (FIPS: BoringCrypto pilot-agent, AWS-LC FIPS Envoy)";
    "org.opencontainers.image.description" =
      "Istio proxyv2: BoringCrypto pilot-agent (CMVP #4735) with Envoy statically linked to AWS-LC FIPS 3.1.0 (CMVP #5314, tested OE Amazon Linux 2023).";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "istio";
    "io.nix-containers.envoy.crypto-module" = "AWS-LC 3 Cryptographic Module (static) AWS-LC FIPS 3.1.0";
    "io.nix-containers.envoy.cmvp-certificate" = "5314";
    # No io.nix-containers.compliance label: the certificate's tested OE is
    # Amazon Linux 2023, so FIPS standing on any other host OS is a user
    # affirmation the deployer makes, not something the image can claim.
  };
}
