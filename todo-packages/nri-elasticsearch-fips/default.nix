{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-elasticsearch-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-elasticsearch-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-elasticsearch-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-elasticsearch-fips";
    homepage = "https://github.com/TODO/nri-elasticsearch-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
