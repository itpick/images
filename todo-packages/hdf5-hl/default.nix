{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hdf5-hl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hdf5-hl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hdf5-hl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hdf5-hl";
    homepage = "https://github.com/TODO/hdf5-hl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
