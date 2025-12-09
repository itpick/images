{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dataplaneapi
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dataplaneapi";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dataplaneapi";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dataplaneapi";
    homepage = "https://github.com/TODO/dataplaneapi";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
