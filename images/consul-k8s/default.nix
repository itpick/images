{ mkImage, pkgs, lib, ... }:

# Consul on Kubernetes control plane (consul-k8s-control-plane)
# https://github.com/hashicorp/consul-k8s

let
  version = "2.0.1";

  consul-k8s = pkgs.stdenv.mkDerivation rec {
    pname = "consul-k8s-control-plane";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://releases.hashicorp.com/consul-k8s-control-plane/${version}/consul-k8s-control-plane_${version}_linux_amd64.zip";
      hash = "sha256-lzXCzd8sPhaBAqGYjN9FH+F2nINiUDIhbbT35hHCaLk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      install -m755 consul-k8s-control-plane $out/bin/consul-k8s-control-plane
      runHook postInstall
    '';

    meta = with lib; {
      description = "Consul on Kubernetes control plane";
      homepage = "https://github.com/hashicorp/consul-k8s";
      license = licenses.mpl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  drv = consul-k8s;
  name = "consul-k8s";
  tag = "v${version}";
  entrypoint = [ "${consul-k8s}/bin/consul-k8s-control-plane" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "consul-k8s";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
