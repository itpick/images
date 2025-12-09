{ lib, stdenv, fetchFromGitHub, ... }:

# Package: debezium-3.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "debezium";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "debezium";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for debezium";
    homepage = "https://github.com/TODO/debezium";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
