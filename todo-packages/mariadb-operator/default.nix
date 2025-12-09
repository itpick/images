{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mariadb-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mariadb-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mariadb-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mariadb-operator";
    homepage = "https://github.com/TODO/mariadb-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
