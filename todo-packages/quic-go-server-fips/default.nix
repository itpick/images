{ lib, stdenv, fetchFromGitHub, ... }:

# Package: quic-go-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "quic-go-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "quic-go-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for quic-go-server-fips";
    homepage = "https://github.com/TODO/quic-go-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
