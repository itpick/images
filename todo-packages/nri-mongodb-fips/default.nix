{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-mongodb-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-mongodb-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-mongodb-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-mongodb-fips";
    homepage = "https://github.com/TODO/nri-mongodb-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
