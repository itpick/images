{ lib, stdenv, fetchFromGitHub, ... }:

# Package: debezium-3.0-connector-sqlserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "debezium-3.0-connector-sqlserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "debezium-3.0-connector-sqlserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for debezium-3.0-connector-sqlserver";
    homepage = "https://github.com/TODO/debezium-3.0-connector-sqlserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
