{ lib, stdenv, fetchFromGitHub, ... }:

# Package: postgresql-17-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "postgresql-17-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "postgresql-17-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for postgresql-17-base";
    homepage = "https://github.com/TODO/postgresql-17-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
