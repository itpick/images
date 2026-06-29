{ mkImage, pkgs, lib, ... }:

# rekor-server — upstream prebuilt release binary
let
  version = "1.5.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "rekor-server";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/sigstore/rekor/releases/download/v1.5.2/rekor-server-linux-amd64";
      hash = "sha256-L1FxtLiing4VeTwqK2Ki0SZoVQ+bWA661qdieyfecXA=";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/rekor-server
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "rekor-fips-server";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/rekor-server" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "rekor-fips-server";
    "org.opencontainers.image.description" = "Sigstore Rekor transparency log server";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
