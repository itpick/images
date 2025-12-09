{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cassandra-reaper
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cassandra-reaper";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cassandra-reaper";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cassandra-reaper";
    homepage = "https://github.com/TODO/cassandra-reaper";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
