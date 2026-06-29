{ mkImage, pkgs, lib, ... }:

# k8s_gateway - a CoreDNS-based DNS server that resolves Kubernetes Ingress/Service
# hostnames from outside the cluster.
# https://github.com/ori-edge/k8s_gateway

let
  version = "0.4.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "k8s_gateway";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/ori-edge/k8s_gateway/releases/download/v${version}/k8s_gateway_${version}_linux_amd64.tar.gz";
      hash = "sha256-JIit6iXJq2qSGbFO9p3vidr/5ohEGbqRybGtLctJrUg=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 coredns $out/bin/k8s_gateway
      runHook postInstall
    '';

    meta = with lib; {
      description = "CoreDNS-based DNS server for exposing Kubernetes resources externally";
      homepage = "https://github.com/ori-edge/k8s_gateway";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "k8s_gateway";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/k8s_gateway" ];
  cmd = [ "-version" ];

  labels = {
    "org.opencontainers.image.title" = "k8s_gateway";
    "org.opencontainers.image.description" = "CoreDNS-based DNS server for exposing Kubernetes resources externally";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
