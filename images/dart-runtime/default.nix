{ mkImage, pkgs, lib, ... }:

# dart-runtime - the Dart SDK runtime (official prebuilt SDK release).
# The dart binary depends on the rest of the SDK tree (snapshots, libs),
# so the whole dart-sdk directory is installed and bin/ symlinked.
# https://dart.dev

let
  version = "3.12.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "dart-runtime";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://storage.googleapis.com/dart-archive/channels/stable/release/${version}/sdk/dartsdk-linux-x64-release.zip";
      hash = "sha256:0bcw54235hhwxm57823nkk7h2hhp1nxnih2621vkcpq7rx27pr18";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "dart-sdk";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/dart-sdk
      cp -r . $out/dart-sdk/
      mkdir -p $out/bin
      ln -s $out/dart-sdk/bin/dart $out/bin/dart
      runHook postInstall
    '';
  };

in mkImage {
  inherit drv;
  name = "dart-runtime";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/dart" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "dart-runtime";
    "org.opencontainers.image.description" = "Dart SDK runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
