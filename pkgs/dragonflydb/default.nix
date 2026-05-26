# DragonflyDB - Modern Redis/Memcached replacement
# https://www.dragonflydb.io/
#
# Uses the upstream prebuilt binary release instead of nixpkgs' source build.
# The nixpkgs derivation (dragonflydb-1.34.2 at time of writing) fails to
# build under nixos-unstable: the vendored abseil_cpp ninja step errors out
# and there's no cache hit. Until nixpkgs catches up to a working version,
# we fetch the official static binary directly and autoPatchelf it.

{ stdenv, lib, fetchurl, autoPatchelfHook, zlib }:

let
  version = "1.38.1";
  selectSystem = {
    "x86_64-linux" = {
      arch = "x86_64";
      hash = "sha256-JtadFyTUkFsZMQnT3IoYUI4KojXOxDTW2Iah/u29qx4=";
    };
    "aarch64-linux" = {
      arch = "aarch64";
      hash = "sha256-9zZ/FSFaC0kFjaOdjorBMqrHykk8X7XhH+rHaEBYSc0=";
    };
  };
  sys = selectSystem.${stdenv.hostPlatform.system}
    or (throw "dragonflydb: unsupported system ${stdenv.hostPlatform.system}");
in
stdenv.mkDerivation {
  pname = "dragonflydb";
  inherit version;

  src = fetchurl {
    url = "https://github.com/dragonflydb/dragonfly/releases/download/v${version}/dragonfly-${sys.arch}.tar.gz";
    hash = sys.hash;
  };

  # Tarball contains files at the root (no top-level directory).
  sourceRoot = ".";

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ stdenv.cc.cc.lib zlib ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 dragonfly-${sys.arch} $out/bin/dragonfly
    runHook postInstall
  '';

  meta = {
    description = "Modern in-memory datastore compatible with Redis and Memcached APIs";
    homepage = "https://www.dragonflydb.io/";
    license = lib.licenses.bsl11;
    platforms = [ "x86_64-linux" "aarch64-linux" ];
    mainProgram = "dragonfly";
  };
}
