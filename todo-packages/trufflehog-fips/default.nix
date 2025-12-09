{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trufflehog-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trufflehog-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trufflehog-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trufflehog-fips";
    homepage = "https://github.com/TODO/trufflehog-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
