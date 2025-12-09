{ lib, stdenv, fetchFromGitHub, ... }:

# Package: debezium-connector-spanner-3.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "debezium-connector-spanner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "debezium-connector-spanner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for debezium-connector-spanner";
    homepage = "https://github.com/TODO/debezium-connector-spanner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
