{ mkImage, pkgs, lib, ... }:

# EKS Distro kube-apiserver - packaged from the upstream Kubernetes release binary.
# https://kubernetes.io
let
  version = "1.31.14";

  drv = pkgs.stdenv.mkDerivation {
    pname = "eks-distro-kube-apiserver";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://dl.k8s.io/v${version}/bin/linux/amd64/kube-apiserver";
      hash = "sha256:186w1pgrjcdw69frj8ml43jprvar02a82hx7979mjllwwrpbhnnv";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/kube-apiserver
      runHook postInstall
    '';

    meta = with lib; {
      description = "Kubernetes API server (EKS Distro)";
      homepage = "https://kubernetes.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "eks-distro-kube-apiserver";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kube-apiserver" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "eks-distro-kube-apiserver";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
