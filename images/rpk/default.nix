{ mkImage, pkgs, lib, ... }:

# rpk - Redpanda CLI (Redpanda Keeper)
# https://github.com/redpanda-data/redpanda

let
  version = "26.1.12";

  drv = pkgs.stdenv.mkDerivation {
    pname = "rpk";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/redpanda-data/redpanda/releases/download/v${version}/rpk-linux-amd64.zip";
      hash = "sha256:09xsfvaqadkxdjaf881y9qv75c2p96h40x5f9npr5ng9y0b559fw";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.unzip ];

    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 rpk $out/bin/rpk
      runHook postInstall
    '';

    meta = with lib; {
      description = "Redpanda CLI (rpk)";
      homepage = "https://github.com/redpanda-data/redpanda";
      license = licenses.bsl11;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "rpk";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/rpk" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "rpk";
    "org.opencontainers.image.description" = "Redpanda CLI";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
