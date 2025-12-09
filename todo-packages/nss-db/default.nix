{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nss-db
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nss-db";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nss-db";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nss-db";
    homepage = "https://github.com/TODO/nss-db";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
