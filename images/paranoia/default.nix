{ mkImage, pkgs, lib, ... }:

# paranoia - inspect the certificate authorities in container images
# https://github.com/jetstack/paranoia

let
  version = "0.5.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "paranoia";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/jetstack/paranoia/releases/download/v${version}/paranoia-linux-amd64";
      hash = "sha256:14m7vlvg83nl9yggpzfrpfli7qh46qvkzrpy5yhkvwf1jg5sppja";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/paranoia
      runHook postInstall
    '';

    meta = with lib; {
      description = "Inspect the certificate authorities in container images";
      homepage = "https://github.com/jetstack/paranoia";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "paranoia";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/paranoia" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "paranoia";
    "org.opencontainers.image.description" = "Inspect the certificate authorities in container images";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
