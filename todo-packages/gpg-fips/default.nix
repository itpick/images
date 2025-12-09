{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gpg-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gpg-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gpg-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gpg-fips";
    homepage = "https://github.com/TODO/gpg-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
