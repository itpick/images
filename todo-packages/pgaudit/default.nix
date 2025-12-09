{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pgaudit-18
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pgaudit";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pgaudit";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pgaudit";
    homepage = "https://github.com/TODO/pgaudit";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
