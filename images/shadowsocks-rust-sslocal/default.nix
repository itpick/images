{ mkImage, pkgs, lib, ... }:

# shadowsocks-rust - sslocal (local SOCKS5 client)
# https://github.com/shadowsocks/shadowsocks-rust

let
  version = "1.24.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "shadowsocks-rust-sslocal";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/shadowsocks/shadowsocks-rust/releases/download/v${version}/shadowsocks-v${version}.x86_64-unknown-linux-gnu.tar.xz";
      hash = "sha256:0razn3q6g2klbgxhs90sdn7wzs3nrj6m6saw5wsk5rsi9vxqwljz";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib pkgs.zlib pkgs.openssl ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 sslocal $out/bin/sslocal
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "shadowsocks-rust-sslocal";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/sslocal" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "shadowsocks-rust-sslocal";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
