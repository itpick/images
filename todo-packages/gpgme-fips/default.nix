{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gpgme-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gpgme-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gpgme-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gpgme-fips";
    homepage = "https://github.com/TODO/gpgme-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
