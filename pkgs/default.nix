# Custom packages for nix-containers
# These packages are not available in nixpkgs and are built from source or binary distributions

{ pkgs }:

{
  apache-nifi = pkgs.callPackage ./apache-nifi { };
  cert-manager = pkgs.callPackage ./cert-manager { };
  cilium = pkgs.callPackage ./cilium { };
  cilium-certgen = pkgs.callPackage ./certgen { };
  cloudnative-pg = pkgs.callPackage ./cloudnative-pg { };
  configmap-reload = pkgs.callPackage ./configmap-reload { };
  crossplane-server = pkgs.callPackage ./crossplane { };
  hubble-ui = pkgs.callPackage ./hubble-ui { };
  istio = pkgs.callPackage ./istio { };
  keda = pkgs.callPackage ./keda { };
  kube-rbac-proxy = pkgs.callPackage ./kube-rbac-proxy { };
}
