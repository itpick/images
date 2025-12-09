{ lib, stdenv, fetchFromGitHub, ... }:

# Package: debezium-3.0-connector-mongodb
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "debezium-3.0-connector-mongodb";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "debezium-3.0-connector-mongodb";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for debezium-3.0-connector-mongodb";
    homepage = "https://github.com/TODO/debezium-3.0-connector-mongodb";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
