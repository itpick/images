{ mkImage, pkgs, lib, ... }:

# Falco - cloud-native runtime security
# https://github.com/falcosecurity/falco

let
  version = "0.44.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "falco";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://download.falco.org/packages/bin/x86_64/falco-${version}-x86_64.tar.gz";
      hash = "sha256:09r12d1h5lm8jwb14dw42hjygihk2r3b687w43jr3z16vwxplnxw";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      elfutils
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r falco-${version}-x86_64/usr $out/usr
      cp -r falco-${version}-x86_64/etc $out/etc
      mkdir -p $out/bin
      ln -s $out/usr/bin/falco $out/bin/falco
      ln -s $out/usr/bin/falcoctl $out/bin/falcoctl
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "Cloud-native runtime security tool";
      homepage = "https://falco.org";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "falco";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/falco" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "falco";
    "org.opencontainers.image.description" = "Cloud-native runtime security";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
