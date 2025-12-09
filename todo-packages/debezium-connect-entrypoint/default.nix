{ lib, stdenv, fetchFromGitHub, ... }:

# Package: debezium-connect-entrypoint-3.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "debezium-connect-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "debezium-connect-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for debezium-connect-entrypoint";
    homepage = "https://github.com/TODO/debezium-connect-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
