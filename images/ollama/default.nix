{ mkImage, pkgs, lib, ... }:

# Ollama - Run large language models locally
# https://ollama.ai/
# Packaged from the upstream prebuilt release bundle (bin/ollama + bundled
# CUDA runner libs), which tracks the latest version without the source
# build's version-specific llama.cpp patches.

let
  version = "0.31.1";
  ollama = pkgs.stdenv.mkDerivation {
    pname = "ollama";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/ollama/ollama/releases/download/v${version}/ollama-linux-amd64.tar.zst";
      hash = "sha256-0pc4HvwTZFH2+rud1kSmf3D+UcFoFaDEqV/w4yejr7Q=";
    };
    nativeBuildInputs = [ pkgs.zstd pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    # GPU libs resolve libcuda/nvidia-ml from the host at runtime.
    autoPatchelfIgnoreMissingDeps = true;
    unpackPhase = ''
      runHook preUnpack
      mkdir -p src
      tar --use-compress-program=unzstd -xf "$src" -C src
      runHook postUnpack
    '';
    sourceRoot = "src";
    installPhase = ''
      runHook preInstall
      mkdir -p "$out"
      cp -r bin lib "$out"/
      runHook postInstall
    '';
  };
in
mkImage {
  drv = ollama;
  name = "ollama";
  tag = "v${version}";
  entrypoint = [ "${ollama}/bin/ollama" ];
  cmd = [ "serve" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Ollama";
    "org.opencontainers.image.description" = "Get up and running with large language models locally";
    "org.opencontainers.image.version" = version;
  };
}
