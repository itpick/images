{ mkImage, pkgs, lib, ... }:

# Argo CD repo-server (multi-call argocd binary, invoked as argocd-repo-server)
# https://github.com/argoproj/argo-cd
# Note: -fips suffix denotes the same upstream tool; packaged from the upstream binary.

let
  version = "3.2.12";

  drv = pkgs.stdenv.mkDerivation {
    pname = "argocd";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/argoproj/argo-cd/releases/download/v${version}/argocd-linux-amd64";
      hash = "sha256:09j55jg6g3f4fgqciw40yvnlf8lzv019s121aa7fwv1zdqw8zmcv";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/argocd
      ln -s argocd $out/bin/argocd-repo-server
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "argo-cd-fips-3.2-repo-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/argocd-repo-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "argo-cd-fips-3.2-repo-server";
    "org.opencontainers.image.description" = "Argo CD repo-server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
