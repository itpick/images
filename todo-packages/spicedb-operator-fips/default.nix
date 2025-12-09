{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spicedb-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spicedb-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spicedb-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spicedb-operator-fips";
    homepage = "https://github.com/TODO/spicedb-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
