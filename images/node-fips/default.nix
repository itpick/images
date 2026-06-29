{ mkImage, pkgs, lib, ... }:

# node-fips - Node.js JavaScript runtime (official upstream linux x64 build)
# https://nodejs.org / https://github.com/nodejs/node
# Packaged from the official prebuilt nodejs.org release binary.

let
  version = "24.18.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "node-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.xz";
      hash = "sha256-VapxU/nYjyjXZfza1a5pRbXA+Yo2iBcDgX5MRQ+nZ0I=";
    };

    sourceRoot = "node-v${version}-linux-x64";

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out
      cp -r bin include lib share $out/
      runHook postInstall
    '';

    meta = with lib; {
      description = "Node.js JavaScript runtime (official upstream binary)";
      homepage = "https://nodejs.org";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "node-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/node" ];
  cmd = [ "--version" ];

  labels = {
    "org.opencontainers.image.title" = "node-fips";
    "org.opencontainers.image.description" = "Node.js JavaScript runtime";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
