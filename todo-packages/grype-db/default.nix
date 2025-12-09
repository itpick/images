{ lib, stdenv, fetchFromGitHub, ... }:

# Package: grype-db
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "grype-db";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "grype-db";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for grype-db";
    homepage = "https://github.com/TODO/grype-db";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
