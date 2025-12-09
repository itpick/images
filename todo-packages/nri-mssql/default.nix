{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-mssql
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-mssql";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-mssql";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-mssql";
    homepage = "https://github.com/TODO/nri-mssql";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
