{ mkImage, pkgs, lib, ... }:

# Argo CD CLI (argo-cd-fips variant) - upstream prebuilt release binary
# https://github.com/argoproj/argo-cd
# The -fips suffix is an upstream naming variant; this packages the upstream argocd binary.

let
  version = "3.4.4";

  drv = pkgs.stdenv.mkDerivation {
    pname = "argocd";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/argoproj/argo-cd/releases/download/v${version}/argocd-linux-amd64";
      hash = "sha256-uTwxKVaIDJWXokan0ecF+7fufxnFIpr/3smbJtVmPgk=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/argocd
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "argo-cd-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/argocd" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "argo-cd-fips";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
