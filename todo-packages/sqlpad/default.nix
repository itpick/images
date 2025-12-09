{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sqlpad
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sqlpad";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sqlpad";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sqlpad";
    homepage = "https://github.com/TODO/sqlpad";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
