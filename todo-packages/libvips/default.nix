{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libvips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libvips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libvips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libvips";
    homepage = "https://github.com/TODO/libvips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
