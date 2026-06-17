{ lib, stdenv, fetchurl }:

# https://github.com/vectordotdev/vector
# Override nixpkgs vector: bump to 0.56.0 ahead of nixpkgs 0.55.0.
#
# Why an override rather than a flake.lock bump:
#   As of 2026-06-17 nixos-unstable HEAD (rev 567a49d1) still pins
#   vector 0.55.0; there is no nixos-unstable revision shipping 0.56.0
#   yet (no nixpkgs PR open either). Bumping the channel would not
#   deliver 0.56 and would churn unrelated packages.
#
# Why the upstream prebuilt:
#   Vector is a large Rust workspace (~140 crates) with native deps
#   (openssl, rdkafka, oniguruma, etc.). The upstream musl tarball is
#   a static-pie binary, so we avoid rebuilding it from source and
#   keep the diff focused on this one package. Same pattern this repo
#   already uses for pulumi (see ../pulumi/default.nix).

let
  version = "0.56.0";
  srcs = {
    x86_64-linux = fetchurl {
      url = "https://github.com/vectordotdev/vector/releases/download/v${version}/vector-${version}-x86_64-unknown-linux-musl.tar.gz";
      hash = "sha256-jBFMXp/ZZGUW8BTV2DdpBEfPDU9Duko3RnE7wGErA5s=";
    };
    aarch64-linux = fetchurl {
      url = "https://github.com/vectordotdev/vector/releases/download/v${version}/vector-${version}-aarch64-unknown-linux-musl.tar.gz";
      hash = "sha256-r6ODomTnqzc9rGgoHNhvuAj4RHuzgTwItbC6quAxSgU=";
    };
  };
in stdenv.mkDerivation {
  pname = "vector";
  inherit version;

  src = srcs.${stdenv.hostPlatform.system};

  dontBuild = true;
  dontConfigure = true;
  dontStrip = true; # static-pie, already stripped/optimised upstream

  # The upstream tarball has a single top-level directory
  # (vector-<arch>-unknown-linux-musl) which unpackPhase enters
  # automatically. From there the binary lives at bin/vector.
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp bin/vector $out/bin/vector
    chmod +x $out/bin/vector
    runHook postInstall
  '';

  meta = with lib; {
    description = "High-performance observability data pipeline for logs, metrics, and traces";
    homepage = "https://vector.dev";
    changelog = "https://github.com/vectordotdev/vector/releases/tag/v${version}";
    license = licenses.mpl20;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    mainProgram = "vector";
  };
}
