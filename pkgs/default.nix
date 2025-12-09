# Custom packages for nix-containers
# These packages are not available in nixpkgs and are built from source or binary distributions

{ pkgs }:

{
  apache-nifi = pkgs.callPackage ./apache-nifi { };
  cert-manager = pkgs.callPackage ./cert-manager { };
  cloudnative-pg = pkgs.callPackage ./cloudnative-pg { };
  configmap-reload = pkgs.callPackage ./configmap-reload { };
  keda = pkgs.callPackage ./keda { };
  kube-rbac-proxy = pkgs.callPackage ./kube-rbac-proxy { };
}
