{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cassandra-fips-5.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cassandra-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cassandra-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cassandra-fips";
    homepage = "https://github.com/TODO/cassandra-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
