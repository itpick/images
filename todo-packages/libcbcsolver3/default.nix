{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcbcsolver3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcbcsolver3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcbcsolver3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcbcsolver3";
    homepage = "https://github.com/TODO/libcbcsolver3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
