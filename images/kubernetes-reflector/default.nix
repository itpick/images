# kubernetes-reflector
# =============
# Kubernetes Reflector - Reflect secrets and configmaps across namespaces
# https://github.com/emberstack/kubernetes-reflector

{ nix2container, pkgs, lib, ... }:

# Kubernetes Reflector is a .NET application that mirrors secrets and configmaps
# across Kubernetes namespaces

let
  version = "9.1.44";

in
nix2container.buildImage {
  name = "kubernetes-reflector";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "kubernetes-reflector-root";
    paths = with pkgs; [
      # .NET runtime
      dotnet-runtime_8

      # SSL/TLS
      cacert

      # ICU data for .NET
      icu

      # Create directories
      (pkgs.runCommand "kubernetes-reflector-dirs" {} ''
        mkdir -p $out/app
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/app" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.dotnet-runtime_8}/bin/dotnet" ];
    cmd = [ "/app/ES.Kubernetes.Reflector.Host.dll" ];
    workingDir = "/app";
    env = [
      "DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false"
      "LC_ALL=en_US.UTF-8"
    ];
    labels = {
      "org.opencontainers.image.title" = "Kubernetes Reflector";
      "org.opencontainers.image.description" = "Reflect secrets and configmaps across Kubernetes namespaces";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "reflector";
    };
  };
}
