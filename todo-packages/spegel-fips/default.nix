{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spegel-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spegel-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spegel-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spegel-fips";
    homepage = "https://github.com/TODO/spegel-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
