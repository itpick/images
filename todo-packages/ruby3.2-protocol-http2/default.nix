{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ruby3.2-protocol-http2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ruby3.2-protocol-http2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ruby3.2-protocol-http2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ruby3.2-protocol-http2";
    homepage = "https://github.com/TODO/ruby3.2-protocol-http2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
