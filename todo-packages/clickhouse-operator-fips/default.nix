{ lib, stdenv, fetchFromGitHub, ... }:

# Package: clickhouse-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "clickhouse-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "clickhouse-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for clickhouse-operator-fips";
    homepage = "https://github.com/TODO/clickhouse-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
