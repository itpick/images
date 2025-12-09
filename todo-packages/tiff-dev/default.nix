{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tiff-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tiff-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tiff-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tiff-dev";
    homepage = "https://github.com/TODO/tiff-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
