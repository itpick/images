{ lib, stdenv, fetchFromGitHub, ... }:

# Package: quic-go-client-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "quic-go-client-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "quic-go-client-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for quic-go-client-fips";
    homepage = "https://github.com/TODO/quic-go-client-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
