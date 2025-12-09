{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dataplaneapi-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dataplaneapi-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dataplaneapi-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dataplaneapi-fips";
    homepage = "https://github.com/TODO/dataplaneapi-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
