{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-postgresql
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-postgresql";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-postgresql";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-postgresql";
    homepage = "https://github.com/TODO/nri-postgresql";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
