{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-cassandra
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-cassandra";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-cassandra";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-cassandra";
    homepage = "https://github.com/TODO/nri-cassandra";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
