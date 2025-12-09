{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spicedb-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spicedb-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spicedb-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spicedb-fips";
    homepage = "https://github.com/TODO/spicedb-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
