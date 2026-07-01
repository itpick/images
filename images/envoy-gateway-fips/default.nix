{ mkImage, pkgs, lib, ... }:

# Envoy Gateway - manages Envoy Proxy as a standalone or Kubernetes-based API Gateway
# https://github.com/envoyproxy/gateway

let
  version = "1.8.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "envoy-gateway";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/envoyproxy/gateway/releases/download/v${version}/envoy-gateway_v${version}_linux_amd64.tar.gz";
      hash = "sha256-habJf24qUSopbq+5b60rj0p3dCtgKygqAQAGWIPX/IM=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/linux/amd64/envoy-gateway $out/bin/envoy-gateway
      runHook postInstall
    '';

    meta = with lib; {
      description = "Manages Envoy Proxy as a standalone or Kubernetes-based API Gateway";
      homepage = "https://github.com/envoyproxy/gateway";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "envoy-gateway-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/envoy-gateway" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "envoy-gateway-fips";
    "org.opencontainers.image.description" = "Envoy Gateway - Kubernetes-based API Gateway";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
