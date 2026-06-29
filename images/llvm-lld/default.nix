{ mkImage, pkgs, lib, ... }:

# LLVM lld - the LLVM linker
# https://github.com/llvm/llvm-project
# Upstream ships lld only inside the official LLVM-<ver>-Linux-X64 release bundle;
# we extract just the lld binaries from it.

let
  version = "22.1.8";

  drv = pkgs.stdenv.mkDerivation {
    pname = "llvm-lld";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${version}/LLVM-${version}-Linux-X64.tar.xz";
      hash = "sha256:113302h1iy84jlqglxv4iy3q43cvxi7flpia4yd4iwya2v7iw3nz";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    # Only the lld toolchain binaries; the bundle is the full LLVM suite.
    sourceRoot = "LLVM-${version}-Linux-X64";

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/lld $out/bin/lld
      for alias in ld.lld ld64.lld lld-link wasm-ld; do
        if [ -e "bin/$alias" ]; then
          ln -s lld $out/bin/$alias
        fi
      done
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "llvm-lld";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/lld" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "llvm-lld";
    "org.opencontainers.image.description" = "LLVM lld linker";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
