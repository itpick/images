{ lib, stdenv, fetchFromGitHub, ... }:

# Package: clickhouse-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "clickhouse-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "clickhouse-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for clickhouse-operator";
    homepage = "https://github.com/TODO/clickhouse-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
