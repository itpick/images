{ mkImage, pkgs, lib, ... }:

# consul-k8s CLI - control plane for Consul on Kubernetes
# https://github.com/hashicorp/consul-k8s
# Official prebuilt binary from releases.hashicorp.com.
# The -fips suffix denotes the same upstream tool (no FIPS claim made here).

let
  version = "1.8.14";

  drv = pkgs.stdenv.mkDerivation {
    pname = "consul-k8s-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://releases.hashicorp.com/consul-k8s/${version}/consul-k8s_${version}_linux_amd64.zip";
      hash = "sha256-1vn3fsmnpVleu2GQNsIwI+8PJ5nWoVjhxaec+32Og7c=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 consul-k8s $out/bin/consul-k8s
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "consul-k8s-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/consul-k8s" ];
  cmd = [ "version" ];
  labels = {
    "org.opencontainers.image.title" = "consul-k8s-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}