{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spiffe-helper-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spiffe-helper-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spiffe-helper-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spiffe-helper-fips";
    homepage = "https://github.com/TODO/spiffe-helper-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
