{ lib, stdenv, fetchFromGitHub, ... }:

# Package: quic-go-client
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "quic-go-client";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "quic-go-client";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for quic-go-client";
    homepage = "https://github.com/TODO/quic-go-client";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
