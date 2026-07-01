{ mkImage, pkgs, lib, ... }:

# Ollama (CPU-only) - Run large language models locally, no GPU runtime.
# https://ollama.ai/
# Packaged from the upstream prebuilt release bundle with the GPU runners
# (CUDA 12/13, Vulkan) stripped — ~1 GB smaller than the GPU-capable image.

let
  version = "0.31.1";
  ollama = pkgs.stdenv.mkDerivation {
    pname = "ollama-cpu-fips";
    inherit version;
    src = pkgs.fetchurl {
      url = "https://github.com/ollama/ollama/releases/download/v${version}/ollama-linux-amd64.tar.zst";
      hash = "sha256-0pc4HvwTZFH2+rud1kSmf3D+UcFoFaDEqV/w4yejr7Q=";
    };
    nativeBuildInputs = [ pkgs.zstd pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
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
      rm -rf "$out/lib/ollama/cuda_v12" "$out/lib/ollama/cuda_v13" "$out/lib/ollama/vulkan"
      runHook postInstall
    '';
  };
in
mkImage {
  drv = ollama;
  name = "ollama-cpu-fips";
  tag = "v${version}";
  entrypoint = [ "${ollama}/bin/ollama" ];
  cmd = [ "serve" ];
  extraPkgs = with pkgs; [ cacert ];
  labels = {
    "org.opencontainers.image.title" = "Ollama (CPU-only)";
    "org.opencontainers.image.description" = "Get up and running with large language models locally — CPU-only, no GPU runtime";
    "org.opencontainers.image.version" = version;
  };
}
