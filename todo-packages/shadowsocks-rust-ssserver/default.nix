{ lib, stdenv, fetchFromGitHub, ... }:

# Package: shadowsocks-rust-ssserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "shadowsocks-rust-ssserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "shadowsocks-rust-ssserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for shadowsocks-rust-ssserver";
    homepage = "https://github.com/TODO/shadowsocks-rust-ssserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
