{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nist-esv-191
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nist-esv";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nist-esv";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nist-esv";
    homepage = "https://github.com/TODO/nist-esv";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
