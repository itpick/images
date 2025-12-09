{ lib, stdenv, fetchFromGitHub, ... }:

# Package: shadowsocks-rust-sslocal
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "shadowsocks-rust-sslocal";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "shadowsocks-rust-sslocal";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for shadowsocks-rust-sslocal";
    homepage = "https://github.com/TODO/shadowsocks-rust-sslocal";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
