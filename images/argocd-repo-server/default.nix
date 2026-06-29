{ mkImage, pkgs, lib, ... }:

# Argo CD repo-server - serves and renders Git repository manifests
# https://github.com/argoproj/argo-cd
#
# Argo CD ships a single statically-linked binary whose behaviour is selected
# by the basename of argv[0]. Installing it as `argocd-repo-server` makes it
# run the repo-server component (matching the upstream image symlink layout).

let
  version = "3.4.4";

  drv = pkgs.stdenv.mkDerivation {
    pname = "argocd-repo-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/argoproj/argo-cd/releases/download/v${version}/argocd-linux-amd64";
      hash = "sha256-uTwxKVaIDJWXokan0ecF+7fufxnFIpr/3smbJtVmPgk=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/argocd-repo-server
      runHook postInstall
    '';

    meta = with lib; {
      description = "Argo CD repo-server";
      homepage = "https://github.com/argoproj/argo-cd";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "argocd-repo-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/argocd-repo-server" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "argocd-repo-server";
    "org.opencontainers.image.description" = "Argo CD repository server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
