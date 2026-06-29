{ mkImage, pkgs, lib, ... }:

# kubeseal - client for Bitnami Sealed Secrets
# https://github.com/bitnami-labs/sealed-secrets

let
  version = "0.38.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "sealed-secrets-kubeseal";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${version}/kubeseal-${version}-linux-amd64.tar.gz";
      hash = "sha256:0bbcqyimib72vqj1v4w4f2r9sxmf3122lz1y2lkmjrr61jziwybi";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 kubeseal $out/bin/kubeseal
      runHook postInstall
    '';

    meta = with lib; {
      description = "Client tool for Bitnami Sealed Secrets";
      homepage = "https://github.com/bitnami-labs/sealed-secrets";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "sealed-secrets-kubeseal";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/kubeseal" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "sealed-secrets-kubeseal";
    "org.opencontainers.image.description" = "Client (kubeseal) for Bitnami Sealed Secrets";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
