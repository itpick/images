{ lib, stdenv, fetchurl, autoPatchelfHook, unzip, fuse3 }:

# https://github.com/rustfs/rustfs
# NOTE: Building from source requires protobuf, complex workspace setup, etc.
# Using pre-built binary from GitHub releases instead.

stdenv.mkDerivation rec {
  pname = "rustfs";
  version = "1.0.0-beta.8";

  src = fetchurl {
    url = "https://github.com/rustfs/rustfs/releases/download/${version}/rustfs-linux-x86_64-gnu-v${version}.zip";
    hash = "sha256-9tvgVDB0OCDbXDjv2kA7+nwbMJZwE/eSc1qzfO4dwTc=";
  };

  nativeBuildInputs = [ autoPatchelfHook unzip ];
  buildInputs = [ fuse3 stdenv.cc.cc.lib ];

  dontBuild = true;
  dontConfigure = true;

  unpackPhase = ''
    runHook preUnpack
    unzip $src
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp rustfs $out/bin/
    chmod +x $out/bin/rustfs
    runHook postInstall
  '';

  meta = with lib; {
    description = "A distributed POSIX file system built on top of object storage";
    homepage = "https://github.com/rustfs/rustfs";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ sourceTypes.binaryNativeCode ];
  };
}
