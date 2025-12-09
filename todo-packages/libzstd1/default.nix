{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libzstd1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libzstd1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libzstd1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libzstd1";
    homepage = "https://github.com/TODO/libzstd1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
