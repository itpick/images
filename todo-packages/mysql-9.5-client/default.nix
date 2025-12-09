{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mysql-9.5-client
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mysql-9.5-client";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mysql-9.5-client";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mysql-9.5-client";
    homepage = "https://github.com/TODO/mysql-9.5-client";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
