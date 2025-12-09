{ lib, stdenv, fetchFromGitHub, ... }:

# Package: quic-go
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "quic-go";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "quic-go";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for quic-go";
    homepage = "https://github.com/TODO/quic-go";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
