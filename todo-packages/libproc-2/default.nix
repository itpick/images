{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libproc-2-0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libproc-2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libproc-2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libproc-2";
    homepage = "https://github.com/TODO/libproc-2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
