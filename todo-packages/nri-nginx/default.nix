{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-nginx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-nginx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-nginx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-nginx";
    homepage = "https://github.com/TODO/nri-nginx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
