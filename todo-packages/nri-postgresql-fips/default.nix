{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-postgresql-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-postgresql-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-postgresql-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-postgresql-fips";
    homepage = "https://github.com/TODO/nri-postgresql-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
