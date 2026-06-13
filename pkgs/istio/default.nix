# Istio - Service Mesh Platform
# https://github.com/istio/istio
#
# Extracts pre-built binaries from official Istio container images:
# - pilot-discovery: The control plane component (istiod)
# - pilot-agent: Sidecar agent for managing Envoy
# - envoy: The data plane proxy
#
# Using container images because:
# 1. Envoy doesn't build reliably in nixpkgs (bazel issues on aarch64)
# 2. Official images are the supported distribution method
# 3. Ensures binary compatibility with Istio's tested configurations

{ lib, stdenvNoCC, crane, cacert }:

let
  version = "1.30.1";

  arch = if stdenvNoCC.hostPlatform.isAarch64 then "arm64" else "amd64";

  # Layer digests for pilot image (contains pilot-discovery)
  pilotLayers = {
    amd64 = {
      digest = "sha256:1359ddeb16c6c6399f3786088396ea910ed56785f768e41be0735df376378fee";
      hash = "sha256-uTR1Z4wQiDz7SwxrVVTR+pKpmbXIv/80IlxDuGsaDA8=";
    };
    arm64 = {
      digest = "sha256:d21ad85b565022342a6fad82229d9112850f837eb38422125904aa14c3ec8def";
      hash = "sha256-s3FgDUagyOxZSQrkECnuufS4GmaBOudjwHoMT+BEMx8=";
    };
  };

  # Layer digests for proxyv2 image
  # Contains: pilot-agent, envoy, and bootstrap template
  proxyv2Layers = {
    amd64 = {
      # Layer with envoy binary
      envoy = {
        digest = "sha256:0f6f52d6b48efd42c2ebc20774cfc67b39b0a683641204b5d968b3d60ff6930a";
        hash = "sha256-K3QoPs28aV+FEZz2/DtCbM96ygDHBInIcVxmFmRNG70=";
      };
      # Layer with bootstrap template
      bootstrap = {
        digest = "sha256:b9db30739321a4446aa969cba6056ef6b72a47a6eb1cff791eee6472a0279d0d";
        hash = "sha256-8FenTI533DaVKm4oiW4pvmCCbRTxSgLg4Ay1xY/baV0=";
      };
      # Layer with pilot-agent
      pilotAgent = {
        digest = "sha256:d276db19ce85199de06ccbf305efb5bd294c7f1bf4f2b76d08d294fc2b044fb8";
        hash = "sha256-tWStCC/wYacBGBS41Uz1Jn+rvKgWPNJj2eMqrH4WlgI=";
      };
    };
    arm64 = {
      envoy = {
        digest = "sha256:fb5123d64667dc44a2cd1f0dd578303bb62e024f5e11bdbbaaedaa0d94c46d9e";
        hash = "sha256-5QqVXpnmu2RqOC+U90vZQgSww0M0AvrQ53pZDDYJdJc=";
      };
      bootstrap = {
        digest = "sha256:378b70b952016a2644e54ce797889a3e775e380a66fee791349f20d00d3179c9";
        hash = "sha256-8FenTI533DaVKm4oiW4pvmCCbRTxSgLg4Ay1xY/baV0=";
      };
      pilotAgent = {
        digest = "sha256:620594827e2d6cd71627d4f3b9f4568031e0a57ee63ce7b377a107a85d75b852";
        hash = "sha256-esifkeMnhic9FYGjVSeLlIbkTMmJyN3RtaggEt2a9EY=";
      };
    };
  };

  # pilot-discovery (istiod control plane)
  pilot-discovery = stdenvNoCC.mkDerivation {
    pname = "pilot-discovery";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/pilot:${version}@${pilotLayers.${arch}.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/pilot-discovery $out/bin/pilot-discovery
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = pilotLayers.${arch}.hash;

    meta = with lib; {
      description = "Istio Pilot Discovery (istiod control plane)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "pilot-discovery";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # pilot-agent (sidecar agent)
  pilot-agent = stdenvNoCC.mkDerivation {
    pname = "pilot-agent";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.pilotAgent.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/pilot-agent $out/bin/pilot-agent
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.pilotAgent.hash;

    meta = with lib; {
      description = "Istio Pilot Agent (sidecar agent)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "pilot-agent";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # envoy proxy
  envoy = stdenvNoCC.mkDerivation {
    pname = "istio-envoy";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.envoy.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 extract/usr/local/bin/envoy $out/bin/envoy
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.envoy.hash;

    meta = with lib; {
      description = "Istio Envoy Proxy";
      homepage = "https://istio.io";
      license = licenses.asl20;
      mainProgram = "envoy";
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # bootstrap config (envoy bootstrap template)
  bootstrap = stdenvNoCC.mkDerivation {
    pname = "istio-bootstrap";
    inherit version;

    dontUnpack = true;
    nativeBuildInputs = [ crane ];

    SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

    buildPhase = ''
      runHook preBuild
      mkdir -p extract
      crane blob docker.io/istio/proxyv2:${version}@${proxyv2Layers.${arch}.bootstrap.digest} | tar -xz -C extract
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/var/lib/istio/envoy
      cp extract/var/lib/istio/envoy/envoy_bootstrap_tmpl.json $out/var/lib/istio/envoy/
      runHook postInstall
    '';

    preferLocalBuild = true;
    outputHashMode = "recursive";
    outputHashAlgo = "sha256";
    outputHash = proxyv2Layers.${arch}.bootstrap.hash;

    meta = with lib; {
      description = "Istio Envoy bootstrap template";
      homepage = "https://istio.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # proxyv2-bin: Combined package with pilot-agent, envoy, and bootstrap config
  # Uses symlinkJoin to combine the fixed-output derivations
  proxyv2-bin = stdenvNoCC.mkDerivation {
    pname = "istio-proxyv2";
    inherit version;

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/usr/local/bin $out/var/lib/istio/envoy

      # Copy binaries
      cp ${envoy}/bin/envoy $out/bin/
      cp ${pilot-agent}/bin/pilot-agent $out/bin/

      # Create symlinks in /usr/local/bin (where pilot-agent expects them)
      ln -s $out/bin/envoy $out/usr/local/bin/envoy
      ln -s $out/bin/pilot-agent $out/usr/local/bin/pilot-agent

      # Copy bootstrap template
      cp ${bootstrap}/var/lib/istio/envoy/envoy_bootstrap_tmpl.json $out/var/lib/istio/envoy/

      runHook postInstall
    '';

    meta = with lib; {
      description = "Istio proxyv2 binaries (envoy + pilot-agent + bootstrap)";
      homepage = "https://istio.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

in {
  inherit version;

  # Individual components
  inherit pilot-discovery pilot-agent envoy bootstrap proxyv2-bin;

  # For backwards compatibility, the default package is pilot-discovery
  meta = with lib; {
    description = "Istio service mesh components";
    homepage = "https://istio.io";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
