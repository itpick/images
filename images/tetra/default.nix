{ mkImage, pkgs, lib, ... }:

# tetra - CLI for Tetragon (Cilium eBPF-based security observability & runtime enforcement)
# https://github.com/cilium/tetragon

let
  version = "1.7.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "tetra";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cilium/tetragon/releases/download/v${version}/tetra-linux-amd64.tar.gz";
      hash = "sha256:1naq51qhqvz4451wicgy9xkw64d08y2irm39kcmw1k0ak3sghrd7";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 tetra $out/bin/tetra
      runHook postInstall
    '';

    meta = with lib; {
      description = "CLI for Tetragon";
      homepage = "https://github.com/cilium/tetragon";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "tetra";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/tetra" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "tetra";
    "org.opencontainers.image.description" = "CLI for Tetragon";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
