{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libfmt12
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libfmt12";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libfmt12";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libfmt12";
    homepage = "https://github.com/TODO/libfmt12";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
