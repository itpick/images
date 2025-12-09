{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trino-plugin-tpcds
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trino-plugin-tpcds";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trino-plugin-tpcds";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trino-plugin-tpcds";
    homepage = "https://github.com/TODO/trino-plugin-tpcds";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
