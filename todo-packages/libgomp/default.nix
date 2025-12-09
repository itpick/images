{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libgomp
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libgomp";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libgomp";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libgomp";
    homepage = "https://github.com/TODO/libgomp";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
