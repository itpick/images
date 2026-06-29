{ mkImage, pkgs, lib, ... }:

# Ratify SBOM verifier plugin (fips variant packages the same upstream binary)
# https://github.com/notaryproject/ratify
let
  version = "1.4.0";
  drv = pkgs.stdenv.mkDerivation {
    pname = "ratify-fips-sbom";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/notaryproject/ratify/releases/download/v${version}/ratify_${version}_linux_amd64.tar.gz";
      hash = "sha256-23Ois9IL0X22bz+lJ3pgee1YcjpcmKONgcyofo9mZxo=";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";
    installPhase = ''
      runHook preInstall
      install -Dm755 sbom $out/bin/sbom
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "ratify-fips-sbom";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/sbom" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "ratify-fips-sbom";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
