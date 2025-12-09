{ lib, stdenv, fetchFromGitHub, ... }:

# Package: deck-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "deck-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "deck-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for deck-fips";
    homepage = "https://github.com/TODO/deck-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
