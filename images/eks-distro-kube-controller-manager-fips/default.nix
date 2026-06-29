{ mkImage, pkgs, lib, ... }:

# EKS Distro kube-controller-manager (fips variant) - packaged from the upstream Kubernetes release binary.
# https://kubernetes.io
let
  version = "1.31.14";

  drv = pkgs.stdenv.mkDerivation {
    pname = "eks-distro-kube-controller-manager-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://dl.k8s.io/v${version}/bin/linux/amd64/kube-controller-manager";
      hash = "sha256:0rplkrkhswj8v6r8w52r821b7wihxzdg6xlgx7gk2b0zg99jbwm4";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/kube-controller-manager
      runHook postInstall
    '';

    meta = with lib; {
      description = "Kubernetes controller manager (EKS Distro)";
      homepage = "https://kubernetes.io";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "eks-distro-kube-controller-manager-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kube-controller-manager" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "eks-distro-kube-controller-manager-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
