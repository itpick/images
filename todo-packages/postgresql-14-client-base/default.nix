{ lib, stdenv, fetchFromGitHub, ... }:

# Package: postgresql-14-client-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "postgresql-14-client-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "postgresql-14-client-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for postgresql-14-client-base";
    homepage = "https://github.com/TODO/postgresql-14-client-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
