{ mkImage, pkgs, lib, ... }:

# just - a handy command runner (casey/just)
# https://github.com/casey/just
# Upstream prebuilt linux x86_64 (musl, static) release binary.

let
  version = "1.55.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "just";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/casey/just/releases/download/${version}/just-${version}-x86_64-unknown-linux-musl.tar.gz";
      hash = "sha256-l4F42bINIBeufv3SmyBK/CunXRA7SrnSxOGmQHu9ZIo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 just $out/bin/just
      runHook postInstall
    '';

    meta = with lib; {
      description = "Just a command runner";
      homepage = "https://github.com/casey/just";
      license = licenses.cc0;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "just-newuidmap-newgidmap";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/just" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ shadow ];

  labels = {
    "org.opencontainers.image.title" = "just";
    "org.opencontainers.image.description" = "Just a command runner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
